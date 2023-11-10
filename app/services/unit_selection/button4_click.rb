module UnitSelection::Button4Click
  def button4_click
    @warning_messages = []
    @checkbox18 = false

    @flagstart = @gg_label6.to_i

    @combobox8_visible = true
    if (@flagstart == 1)
      @coefa ||= M::Coefficient.pluck(:coefa).map!{|c| c.map(&:to_f)}
      if (@combobox8_visible == true)
        if (@combobox8.to_s == "")
          @flagini = 0
          @specify_error = true
          raise "Select the unit"
        end
      end

      if (@combobox8_visible == true)
        if (@combobox8.to_s == "")
          @flagini = 0
          @specify_error = true
          raise "Select the unit"
        end
      end

      begin
        if (@combobox2 == "Consorb")
          if (@textbox41.to_f > 100 || @textbox45.to_f > 100)
            @textbox7 = ""
            @flagini = 0
            @specify_error = true
            raise "Relative Humidity is over 100%"
          end
        else
          if (@textbox41.to_f > 100 || @textbox39.to_f > 100)
            if (@flagsgj == 3)
              @textBox61 = ""
            else
              @textbox7 = ""
            end
            @flagini = 0
            @specify_error = true
            raise "Relative Humidity is over 100%"
          end
        end

        if (@radiobutton9 == true)
          if (@textbox50 == "")
            @flagini = 0
            @specify_error = true
            raise "Please fill in the Power HP"
          end
        end

        @p = @textbox9.to_f
        @r = @textbox11.to_f
        @uuu = @textbox15.to_f
        @sss = (@textbox71.to_f / 100 * 360)
        if ((@p + @r + @uuu + @sss) != 360.0)
          @flagini = 0
          @specify_error = true
          raise "Sum of each zone angle is not 360 degree. Input angle again"
        else
          @interrot = @gg_textbox1.to_f
          @minrot = @gg_textbox2.to_f
          @opq = (@gg_textbox3.to_f - @minrot) / @interrot
          @search_results = []
          @input_objects = []
          (1..@opq.to_i.next).to_a.each do |mno|

            @textbox8 = (@minrot + @interrot*(mno - 1)).round(0).to_s
            @rph = @textbox8.to_f
            calc_extra
            presented_datavalue = @datavalue.first.dup
            @search_results.push presented_datavalue
            cloned_object = self.dup
            @input_objects.push cloned_object
          end

          @flagini = 1

          @textbox17 = (@atgoutave - 273.15).round(1).to_s
          @textbox37 = ((@atgoutave - 273.15) * 1.8 + 32).round(1).to_s
          if (@flagdst == 1 || @flagsga == 1)
            @textbox12 = (@axoutave * 1000 * (1.0 + @textbox62.to_f / 100)).round(2).to_s
          else
            @textbox12 = (@axoutave * 1000 * (1.0 + @textbox62.to_f / 100)).round(5).to_s
          end
          if (@flagdst == 1)
            @textbox12 = ((@xb - @sorp * (1.0 - @textbox62.to_f / 100) / @iu / @csa / @itg*(273.15 + 20)*@v / 3600) * 1000).round(5).to_s
          end

          @textbox36 = (@textbox12.to_f * 7).round(2).to_s

          @axoutavesvp = (98066.5 / 1000) * (10**(-7.90298*(373.15 / @atgoutave - 1) + 5.02808*Math.log10(373.15 / @atgoutave) - 0.00000013816*((10 ** (11.344*(1 - @atgoutave))) - 1) + 0.0081328*((10**((-3.49149*(373.15 / @atgoutave - 1)))) - 1) + Math.log10(1.03323)))
          @axoutavewbpp = (@axoutave)*@label139.to_f / 10 / ((@axoutave)+0.622)
          @axoutaverh = @axoutavewbpp / @axoutavesvp * 100
          if (265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611))>0)
            @axoutavedp = 265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611)) + 2.5685647*Math.log((@axoutavewbpp * 1000)) - 16.999402
          else
            if (265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611))<-15)
              @axoutavedp = 265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611)) + 0.10186604*Math.log((@axoutavewbpp * 1000)) - 0.47448632
            else
              @axoutavedp = 265.3*Math.log10((@axoutavewbpp * 1000) / 611) / (9.5 - Math.log10((@axoutavewbpp * 1000) / 611))
            end
          end
          @textbox44 = @axoutavedp.round(1).to_s
          @textbox43 = @axoutaverh.round(1).to_s

          @textbox21 = (@htgoutave - 273.15).round(1).to_s
          @textbox25 = ((@htgoutave - 273.15) * 1.8 + 32).round(1).to_s

          @textbox20 = (@hxoutave * 1000).round(1).to_s
          @textbox24 = (@hxoutave * 1000 * 7).round(1).to_s

          @houtsvp = (98066.5 / 1000) * (10**(-7.90298*(373.15 / @htgoutave - 1) + 5.02808*Math.log10(373.15 / @htgoutave) - 0.00000013816*((10**(11.344*(1 - @htgoutave))) - 1) + 0.0081328*((10**(-3.49149*(373.15 / @htgoutave - 1))) - 1) + Math.log10(1.03323)))

          @xbhoutwbpp = (@hxoutave)*@label139.to_f / 10 / ((@hxoutave)+0.622)

          @xbhoutrh = @xbhoutwbpp / @houtsvp * 100
          if (265.3*Math.log10((@xbhwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhwbpp * 1000) / 611))>0)
            @xbhoutdp = 265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611)) + 2.5685647*Math.log((@xbhoutwbpp * 1000)) - 16.999402
          else
            if (265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611))<-15)
              @xbhoutdp = 265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611)) + 0.10186604*Math.log((@xbhoutwbpp * 1000)) - 0.47448632
            else
              @xbhoutdp = 265.3*Math.log10((@xbhoutwbpp * 1000) / 611) / (9.5 - Math.log10((@xbhoutwbpp * 1000) / 611))
            end
          end
          @textbox74 = @xbhoutdp.round(1).to_s
          @textbox75 = @xbhoutrh.round(1).to_s

          if (@opq == 1)
            if (@xbhoutrh >= 100)
              if (@flagcoefcalc != 1)
                @specify_error = true
                @warning_messages.push("Regeneration outlet humidity is over 100%")
                @flagini = 0
              end
            end
          end

          if (@flag1 == 4 || @flag1 == 3 || @flag1 == 5 || @flag1 == 6 || @flag1 == 8 || @combobox2 == "Recusorb 1" || @combobox2 == "Recusorb 2")
            @textbox18 = (@ptgoutave - 273.15).round(1).to_s
            @textbox35 = ((@ptgoutave - 273.15) * 1.8 + 32).round(1).to_s
          else
            @textbox18 = "-"
          end

          # result()
        end

        @flag = 1
        @textbox14 = "1"
        @textbox5 = (@xx[@maxi - 1] * 1000).round(1).to_s

        if (@radiobutton5 == true)
          if (@textbox5 != "")
            @textbox33 = (@textbox5.to_f * 7).round(1).to_s
          end
        end
        @flagini = 0
        save_search_results
      rescue StandardError => exception
        @flagini = 0
        if @specify_error
          @specify_error = nil
          raise exception.message
        else
          raise "Please check textboxes. Input the numerical Value"
        end
      end
    end
  end

  def save_search_results
    unit = M::Unit.unit_selection.where(applied_area: @user.area).find_by name: @combobox8
    category = unit.m_category
    @saved_search_results = []
    ActiveRecord::Base.transaction do
      @search_results.map do |data|
        data_hash = result_data(data)
        data_hash.delete(:k_flow_rate)
        data_hash.delete(:category)
        data_hash.delete(:unit)
        data_hash
      end.map{|result| ::UnitSelectionResult.new(result)}.each_with_index do |result, index|
        unit_selection_input = ::UnitSelectionInput.new unit_selection_object: @input_objects[index],
          m_category: category, m_unit: unit, is_draff: true
        result.assign_attributes unit_selection_input: unit_selection_input, model_type: :unit_selection, 
          is_draff: true
        unit_selection_input.save!
        @saved_search_results.push result
      end
    end
    @saved_search_results
  end
end
