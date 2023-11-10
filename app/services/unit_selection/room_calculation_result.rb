class UnitSelection::RoomCalculationResult < UnitSelection::BaseResult
  def execute unit_name:, calculation_mode:, b99:, b100:, b112:, b102:, b13:, b16:, b88:, b124:, b125:, height_above_sea_level:
    selected_unit = M::Unit.room_calculation.send(@user.area).find_by_name unit_name
    return {} unless selected_unit
    selected_category = selected_unit.m_category
    combobox2_selected_index_changed selected_category.name
    combobox8_selected_index_changed unit_name
    # @textbox77 = height_above_sea_level
    # change_textbox "textbox77", height_above_sea_level
    # if calculation_mode == "ip"
    #   @radiobutton5 = false
    #   radiobutton5_checkedchanged
    #   @radiobutton6 = true
    #   radiobutton6_checkedchanged
    # end
    case selected_category.name
    when "Recusorb 1"
      if unit_name.in?(Settings.room_calculation.units.dr)
        # change_textbox_value_by_mode("textbox1", b99)
        change_textbox_value_by_mode("textbox60", b99)
        # change_textbox_value_by_mode("textbox4", b99)
        if @radiobutton5
          @textbox81 = b99
          change_textbox "textbox81", b99
        else
          @textbox87 = b99
          # textbox87_text_changed
        end
        if @radiobutton5
          # @textbox82 = b100
          change_textbox "textbox82", b100
        else
          @textbox86 = b100
          # textbox86_text_changed
        end

        change_textbox_value_by_mode("textbox7", b100)
        if @radiobutton5
          # @textbox61 = b100
          change_textbox "textbox61", b100
        else
          @textbox58 = b100
          textbox58_text_changed
        end

        # if @radiobutton5
        #   @textbox79 = b102
        #   textbox79_text_changed
        # else
        #   @textbox78 = b102
        #   # textbox78_text_changed
        # end

        if @radiobutton5
          @textbox76 = b102
          change_textbox "textbox76", b102
        else
          @textbox85 = b102
          textbox85_text_changed
        end

        change_textbox_value_by_mode("textbox23", b88.to_f - b102.to_f)

        if @radiobutton5
          @textbox80 = b112
          change_textbox "textbox80", b112
        else
          @textbox88 = b112
          # textbox88_text_changed
        end
        # change_textbox_value_by_mode("textbox6", b100)


      else
        trigger_change_checkbox
        change_textbox_value_by_mode("textbox1", b99)
        change_textbox_value_by_mode("textbox4", b13)
        change_textbox_value_by_mode("textbox7", b100)
        change_textbox_value_by_mode("textbox6", b16)
        change_textbox_value_by_mode("textbox23", b88.to_f)
        if @radiobutton5
          @textbox79 = @cc[@dstunit][4]
          textbox79_text_changed
        else
          @textbox78 = @cc[@dstunit][4]
          # textbox78_text_changed
        end
      end
    when "Consorb"
      unless unit_name.in?(Settings.room_calculation.units.cs)
        if @checkbox19
          @checkbox19 = false
          checkbox19_checkedchanged
        end
        change_textbox_value_by_mode("textbox1", b99)
        change_textbox_value_by_mode("textbox10", b13)
        change_textbox_value_by_mode("textbox7", b100)
        change_textbox_value_by_mode("textbox19", b16)
        change_textbox_value_by_mode("textbox23", b88.to_f - b102.to_f)
        if @radiobutton5
          @textbox65 = @cc[@dstunit][4]
          textbox65_text_changed
        else
          @textbox83 = @cc[@dstunit][4]
          textbox83_text_changed
        end
      else
        change_textbox_value_by_mode("textbox1", b99)
        change_textbox_value_by_mode("textbox60", b99)

        change_textbox_value_by_mode("textbox10", b13)
        if @radiobutton5
          @textbox81 = b99
          change_textbox "textbox81", b99
        else
          @textbox87 = b99
          textbox87_text_changed
        end

        change_textbox_value_by_mode("textbox7", b100)
        if @radiobutton5
          @textbox61 = b100
          change_textbox "textbox61", b100
        else
          @textbox58 = b100
          textbox58_text_changed
        end

        change_textbox_value_by_mode("textbox19", b16)
        if @radiobutton5
          @textbox82 = b100
          change_textbox "textbox82", b100
        else
          @textbox86 = b100
          textbox86_text_changed
        end

        change_textbox_value_by_mode("textbox23", b88.to_f - b102.to_f)
        if @radiobutton5
          @textbox80 = b112
          change_textbox "textbox80", b112
        else
          @textbox88 = b112
          textbox88_text_changed
        end

        if @radiobutton5
          @textbox65 = @cc[@dstunit][4]
          textbox65_text_changed
        else
          @textbox83 = @cc[@dstunit][4]
          textbox83_text_changed
        end
        if @radiobutton5
          @textbox76 = b102
          change_textbox "textbox76", b102
        else
          @textbox85 = b102
          textbox85_text_changed
        end
      end
    end
    button3_click
    result
  end

  def calculation_starting_capacity unit_name:, calculation_mode:, b99:, b100:, b112:, b102:, b13:, b16:, b88:, b124:, b125:, height_above_sea_level:
    selected_unit = M::Unit.room_calculation.send(@user.area).find_by_name unit_name
    return {} unless selected_unit
    category_name = selected_unit.m_category.name
    combobox2_selected_index_changed category_name
    combobox8_selected_index_changed unit_name
    @textbox77 = height_above_sea_level
    change_textbox "textbox77", height_above_sea_level
    # if calculation_mode == "ip"
    #   @radiobutton5 = false
    #   @radiobutton6 = true
    #   radiobutton6_checkedchanged
    # end
    case category_name
    when "Recusorb 1"
      if unit_name.in?(Settings.room_calculation.units.dr)
        change_textbox_value_by_mode("textbox60", b124)

        if @radiobutton5
          @textbox81 = b124
          change_textbox "textbox81", b124
        else
          @textbox87 = b124
          textbox87_text_changed
        end

        if @radiobutton5
          @textbox61 = b125
          change_textbox "textbox61", b125
        else
          @textbox58 = b125
          textbox58_text_changed
        end

        if @radiobutton5
          @textbox82 = b125
          change_textbox "textbox82", b125
        else
          @textbox86 = b125
          textbox86_text_changed
        end

        if @radiobutton5
          @textbox80 = b88.to_f - b102.to_f
          change_textbox "textbox80", b88.to_f - b102.to_f
        else
          @textbox88 = b88.to_f - b102.to_f
          textbox88_text_changed
        end

        if @radiobutton5
          @textbox76 = b102
          change_textbox "textbox76", b102
        else
          @textbox85 = b102
          textbox85_text_changed
        end
      else
        change_textbox_value_by_mode("textbox1", b124)
        change_textbox_value_by_mode("textbox4", b13)
        change_textbox_value_by_mode("textbox7", b125)
        change_textbox_value_by_mode("textbox6", b16)
        change_textbox_value_by_mode("textbox23", b88)
        if @radiobutton5
          @textbox79 = @cc[@dstunit][4]
          textbox79_text_changed
        else
          @textbox78 = @cc[@dstunit][4]
          textbox78_text_changed
        end
      end
    when "Consorb"
      unless unit_name.in?(Settings.room_calculation.units.cs)
        change_textbox_value_by_mode("textbox1", b124)
        change_textbox_value_by_mode("textbox10", b13)
        change_textbox_value_by_mode("textbox7", b125)
        change_textbox_value_by_mode("textbox19", b16)
        change_textbox_value_by_mode("textbox23", b88)
        if @radiobutton5
          @textbox65 = @cc[@dstunit][4]
          textbox65_text_changed
        else
          @textbox83 = @cc[@dstunit][4]
          textbox83_text_changed
        end
      else
        change_textbox_value_by_mode("textbox60", b124)

        if @radiobutton5
          @textbox81 = b124
          change_textbox "textbox81", b124
        else
          @textbox87 = b124
          textbox87_text_changed
        end

        if @radiobutton5
          @textbox61 = b125
          change_textbox "textbox61", b125
        else
          @textbox58 = b125
          textbox58_text_changed
        end

        if @radiobutton5
          @textbox82 = b125
          change_textbox "textbox82", b125
        else
          @textbox86 = b125
          textbox86_text_changed
        end

        if @radiobutton5
          @textbox80 = b88.to_f - b102.to_f
          change_textbox "textbox80", b88.to_f - b102.to_f
        else
          @textbox88 = b88.to_f - b102.to_f
          textbox88_text_changed
        end

        if @radiobutton5
          @textbox76 = b102
          change_textbox "textbox76", b102
        else
          @textbox85 = b102
          textbox85_text_changed
        end
      end
    end

    button3_click
    @datavalue.first.to_a[20].to_f.round(2).to_s
  end

  private
  def result
    data = @datavalue.first.to_a
    {
      input_dry_air_temperature: data[9].to_f.round(1).to_s,
      input_total_wet_air_flow: input_total_wet_air_flow(data),
      capacity_at_starting_climate: data[20].to_f.round(2).to_s,
      capacity_at_final_climate: data[20].to_f.round(2).to_s,
      tp2: data[9].to_f.round(1).to_s,
      xp2: data[10].to_f.round(3).to_s,
      mr: data[20].to_f.round(2).to_s,
      height_above_sea_level: data[68].to_f.round(1).to_s,
      atmospheric_pressure: @label139
    }
  end

  def input_total_wet_air_flow data
    Settings.room_calculation.total_wet_air_flow_units.include?(@combobox8) ? data[42].to_s : "0"
  end
end
