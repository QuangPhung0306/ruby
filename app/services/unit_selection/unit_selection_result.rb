module UnitSelection
  class UnitSelectionResult < Base
    def execute
      unit = M::Unit.unit_selection.where(applied_area: @user.area).find_by name: self.instance_variable_get(:@combobox8)
      category = unit.m_category

      button3_click
      ActiveRecord::Base.transaction do
        unit_selection_input = UnitSelectionInput.new unit_selection_object: self,
          m_category: category, m_unit: unit, is_draff: true
        unit_selection_result = ::UnitSelectionResult.new unit_selection_input: unit_selection_input,
          model_type: :unit_selection, is_draff: true
        result.each do |key, value|
          unit_selection_result.send("#{key.to_s}=", value) unless ["category", "unit", "k_flow_rate"].include? key.to_s
        end
        unit_selection_input.save!
        return unit_selection_result
      end
    end

    def change_category_or_unit category, unit
      if category.present?
        if unit.present?
          combobox2_selected_index_changed category
          combobox8_selected_index_changed unit
        else
          combobox2_selected_index_changed category
        end
      else
        if unit.present?
          combobox8_selected_index_changed unit
        end
      end
    end

    def change_values elements, input_ids = nil, si_mode = nil
      elements.each do |element|
        element_name, value = element.split(":")
        value = value == "true" ? true : false if element_name.match(/radiobutton|checkbox/)
        case element_name
        when /textbox/
          if element_name == "textbox8"
            @textbox8 = value
          elsif ["textbox102", "textbox101"].include?(element_name)
            instance_variable_set("@#{element_name}", value)
            if element_name == "textbox101"
              xbpwbpp_c2 = value.to_f / 100 * @psvp_c2
              value_textbox82 = ((6.22 * xbpwbpp_c2) / (@label139.to_f - 10 * xbpwbpp_c2) * 1000).round 2
              change_textbox "textbox82", value_textbox82
              change_textbox "textbox86", (value_textbox82 * 7).round(2)
            elsif element_name == "textbox102"
              @xbpwbpp_a1 = value.to_f / 100 * @psvp_a1
              value_textbox61 = ((6.22 * @xbpwbpp_a1) / (@label139.to_f - 10 * @xbpwbpp_a1) * 1000).round 2
              change_textbox "textbox61", value_textbox61
              change_textbox "textbox58", (value_textbox61 * 7).round(2)
            end
          elsif element_name == "textbox39"
            value_textbox6 = (6.22*((value.to_f*@psvp)/100)/(@label139.to_f - 10*((value.to_f*@psvp)/100)))*1000
            change_textbox "textbox6", value_textbox6.round(2)
            change_textbox "textbox26", (value_textbox6.round(2) * 7).round(2)
            instance_variable_set("@#{element_name}", value)
          elsif element_name == "textbox41"
            value_textbox7 = (6.22*((value.to_f*@svp)/100)/(@label139.to_f - 10*((value.to_f*@svp)/100)))*1000
            instance_variable_set("@#{element_name}", value)
            change_textbox "textbox7", value_textbox7.round(2)
            change_textbox "textbox30", value_textbox7.round(2)*7
            # instance_variable_set("@textbox103", value)
          elsif element_name == "textbox103"
            instance_variable_set("@#{element_name}", value)
            value_textbox19 = (6.22*((value.to_f*@svp)/100)/(@label139.to_f - 10*((value.to_f*@svp)/100)))*1000
            change_textbox "textbox19", value_textbox19.round(2)
            change_textbox "textbox47", value_textbox19.round(2)*7
          else
            change_textbox element_name, value
          end
        when "combobox2"
          combobox2_selected_index_changed value
        when "combobox8"
          combobox8_selected_index_changed value
        when "radiobutton5"
          @input_ids = input_ids
          @radiobutton5 = value
          @radiobutton6 = !value
          radiobutton5_checkedchanged
        when "radiobutton6"
          @input_ids = input_ids
          @radiobutton6 = value
          @radiobutton5 = !value
          radiobutton6_checkedchanged
        when "radiobutton8"
          @radiobutton8 = value
          radiobutton8_checkedchanged
        when "radiobutton9"
          @radiobutton9 = value
          radiobutton9_checkedchanged
        when "radiobutton10"
          @radiobutton10 = true
          @radiobutton11 = false
        when "radiobutton11"
          @radiobutton10 = false
          @radiobutton11 = true
        when "checkbox19"
          @checkbox19 = value
          checkbox19_checkedchanged
        when /checkbox(4|6)/
          change_checkbox element_name, value
        when /button3_click/
          button3_click rescue nil
        when "checkbox23"
          @checkbox23 = value
        end
      end
      if (si_mode == "true" || si_mode == true) && @radiobutton5 == false
        @radiobutton5 = true
        @radiobutton6 = false
        dataGridView1_RowHeaderMouseClick
      end
      if (si_mode == "false" || si_mode == false) && @radiobutton6 == false
        @radiobutton5 = false
        @radiobutton6 = true
        dataGridView1_RowHeaderMouseClick
      end
    end

    def change_textbox name, value
      self.instance_variable_set("@#{name}", value)

      if @flagini == 0 && value.present?
        initial_calc
      end
    end

    def change_checkbox element_name, value
      self.instance_variable_set("@#{element_name}", value)

      if @flaginput == 0
        initial_input
      end
      if @flagini == 0
        initial_calc
      end
    end

    def get_all_results
      @present_datavalue.map do |data|
        data_hash = result_data(data)
        data_hash.delete(:k_flow_rate)
        data_hash.delete(:category)
        data_hash.delete(:unit)
        data_hash
      end.map.with_index(0) do |result, index|
        result.merge(id: @result_ids[index]).merge(unit_selection_input_id: @input_ids[index])
      end.map{|result| ::UnitSelectionResult.new(result)}
    end

    def get_field_value_by_mode input_name, mode = "si"
      @mode ||= mode
      if @mode == "si"
        instance_variable_get "@#{input_name}"
      else
        if Settings.unit_selection.si_input.include?(input_name)
          input_name_ip = Settings.unit_selection.ip_input[Settings.unit_selection.si_input.find_index(input_name)]
          instance_variable_get "@#{input_name_ip}"
        else
          instance_variable_get "@#{input_name}"
        end
      end
    end

  	private
    def result
      data = @datavalue.first.to_a
      result_data data
    end

    def result_data data
      data_hash = {
        category: @combobox2,
        unit: @combobox8,
        rotation: data[0].to_f.round(0).to_s,
        diameter: data[1].to_f.round(0).to_s,
        depth: data[2].to_f.round(0).to_s,
        a_tp1: data[3].to_f.round(1).to_s,
        a_xp1: data[4].to_f.round(1).to_s,
        a_fp: data[5].to_f.round(0).to_s,
        a_vp: data[18].to_f.round(1).to_s,
        f_tr1: data[6].to_f.round(1).to_s,
        f_xr1: data[7].to_f.round(1).to_s,
        f_fr: data[8].to_f.round(0).to_s,
        f_vr: data[19].to_f.round(1).to_s,
        b_tp2: data[9].to_f.round(1).to_s,
        b_xp2: data[10].to_f.round(3).to_s,
        b_mr: data[20].to_f.round(2).to_s,
        d_tpu2: "-",
        g_tr2: data[12].to_f.round(1).to_s,
        g_xr2: data[13].to_f.round(1).to_s,
        hp: data[14].to_f.round(1).to_s,
        pp: data[15].to_f.round(2).to_s,
        pr: data[16].to_f.round(2).to_s,
        ppu: "-",
        margin: "-",
        h: data[22].to_f.round(0).to_s,
        i: data[23].to_f.round(0).to_s,
        j: data[24].to_f.round(0).to_s,
        k: data[25].to_f.round(0).to_s,
        l: data[26].to_f.round(0).to_s,
        m: data[27].to_f.round(0).to_s,
        status: @combobox3,
        smo_xp2: "-",
        k_flow_rate: data[64].to_f.round(0).to_s
      }
      if ["Recusorb 1", "Recusorb 2"].include?(@combobox2)
        data_hash.merge!({
          d_tpu2: data[30].to_f.round(1).to_s,
          ppu: data[17].to_f.round(2).to_s,
        })
      end
      data_hash
    end
  end
end
