class UnitSelection::AirMixtureResult < UnitSelection::BaseResult
  def execute unit_name:, calculation_mode:, j_flow_rate:, j_temperature:, j_absolute_humidity:, p_flow_rate:, p_temperature:, p_absolute_humidity:, heater_select:, height_above_sea_level:, textbox2:, textbox50:
    selected_unit = M::Unit.air_mixture.send(@user.area).find_by_name unit_name
    return {} unless selected_unit
    selected_category = selected_unit.m_category
    combobox2_selected_index_changed selected_category.name
    combobox8_selected_index_changed unit_name
    if heater_select == "8"
      @radiobutton8 = true
      @radiobutton9 = false
    else
      @radiobutton9 = true
      @radiobutton8 = false
    end
    # @textbox77 = height_above_sea_level
    # change_textbox "textbox77", height_above_sea_level
    @textbox2 = textbox2
    change_textbox "textbox2", textbox2
    @textbox50 = textbox50
    change_textbox "textbox50", textbox50
    if calculation_mode == "ip"
      @radiobutton5 = false
      radiobutton5_checkedchanged
      @radiobutton6 = true
      radiobutton6_checkedchanged
    end

    if unit_name.in?((Settings.room_calculation.units.dr).concat(Settings.room_calculation.units.cs))
      change_textbox_value_by_mode("textbox1", j_temperature)
      change_textbox_value_by_mode("textbox60", j_temperature)

      change_textbox_value_by_mode("textbox4", j_temperature)
      if @radiobutton5
        @textbox81 = j_temperature
        change_textbox "textbox81", j_temperature
      else
        @textbox87 = j_temperature
        textbox87_text_changed
      end

      change_textbox_value_by_mode("textbox7", j_absolute_humidity)
      # if @radiobutton5
      #   @textbox61 = j_absolute_humidity
      #   change_textbox "textbox61", j_absolute_humidity
      # else
      #   @textbox58 = j_absolute_humidity
      #   textbox58_text_changed
      # end

      change_textbox_value_by_mode("textbox6", j_absolute_humidity)
      if @radiobutton5
        @textbox82 = j_absolute_humidity
        change_textbox "textbox82", j_absolute_humidity
      else
        @textbox86 = j_absolute_humidity
        textbox86_text_changed
      end

      change_textbox_value_by_mode("textbox23", @cc[@dstunit][3])
      if @radiobutton5
        @textbox80 = @cc[@dstunit][3]
        change_textbox "textbox80", @cc[@dstunit][3]
      else
        @textbox88 = @cc[@dstunit][3]
        textbox88_text_changed
      end

      if @radiobutton5
        @textbox79 = @cc[@dstunit][4]
        textbox79_text_changed
      else
        @textbox78 = @cc[@dstunit][4]
        textbox78_text_changed
      end
      if @radiobutton5
        @textbox76 = @cc[@dstunit][4]
        change_textbox "textbox76", @cc[@dstunit][4]
      else
        @textbox85 = @cc[@dstunit][4]
        textbox85_text_changed
      end

      if @radiobutton5
        @textbox10 = j_temperature
      else
        @textbox48 = j_temperature
      end

      if @radiobutton5
        @textbox19 = j_absolute_humidity
      else
        @textbox47 = j_absolute_humidity
      end
    else
      if selected_category.name == "Recusorb 1" && (Settings.room_calculation.units.dr).exclude?(unit_name)
        trigger_change_checkbox
      end
      change_textbox_value_by_mode("textbox1", j_temperature)
      change_textbox_value_by_mode("textbox4", p_temperature)
      change_textbox_value_by_mode("textbox7", j_absolute_humidity)
      change_textbox_value_by_mode("textbox6", p_absolute_humidity)
      change_textbox_value_by_mode("textbox23", j_flow_rate)
      if @radiobutton5
        @textbox79 = p_flow_rate
        textbox79_text_changed
      else
        @textbox78 = p_flow_rate
        textbox78_text_changed
      end
      @checkbox19 = false
      checkbox19_checkedchanged

      change_textbox_value_by_mode("textbox10", p_temperature)

      change_textbox_value_by_mode("textbox19", p_absolute_humidity)
    end

    button3_click
    result
  end

  private
  def result
    data = @datavalue.first.to_a
    hash_result = convert_data_to_hash(data)
    if @radiobutton5
      {si: hash_result, ip: hash_result}
    elsif @radiobutton6
      convert_data = data.dup
      {si: convert_data_to_hash(convert_result_to_si(convert_data)), ip: hash_result}
    end
  end

  def convert_data_to_hash data
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
      margin: data[21].to_f.round(0).to_s,
      h: data[22].to_f.round(0).to_s,
      i: data[23].to_f.round(0).to_s,
      j: data[24].to_f.round(0).to_s,
      k: data[25].to_f.round(0).to_s,
      l: data[26].to_f.round(0).to_s,
      m: data[27].to_f.round(0).to_s,
      status: @combobox3,
      smo_xp2: data[28].to_f.round(3).to_s,
      k_flow_rate: data[64].to_f.round(0).to_s,
      height_above_sea_level: data[68].to_f.round(1).to_s,
      atmospheric_pressure: @label139
    }
    if ["Recusorb 1", "Recusorb 2"].include?(@combobox2)
      data_hash.merge!({
        d_tpu2: data[30].to_f.round(1).to_s,
        ppu: data[17].to_f.round(2).to_s,
        margin: "-",
        smo_xp2: "-"
      })
    end
    data_hash
  end

  def convert_result_to_ip data_hash
    data_hash[3] = data_hash[3].to_f * 1.8 + 32
    data_hash[4] = data_hash[4].to_f * 7
    data_hash[5] = (data_hash[5].to_f / 1.699)
    data_hash[6] = data_hash[6].to_f * 1.8 + 32
    data_hash[7] = data_hash[7].to_f * 7
    data_hash[8] = (data_hash[8].to_f / 1.699)
    data_hash[9] = data_hash[9].to_f * 1.8 + 32
    data_hash[10] = data_hash[10].to_f * 7
    data_hash[11] = data_hash[11].to_f * 1.8 + 32
    data_hash[12] = data_hash[12].to_f * 1.8 + 32
    data_hash[13] = data_hash[13].to_f * 7
    data_hash[14] = data_hash[14].to_f * 1000 / 0.29307107
    data_hash[15] = 0.004015*data_hash[15].to_f
    data_hash[16] = 0.004015*data_hash[16].to_f
    data_hash[17] = 0.004015*data_hash[17].to_f
    data_hash[18] = data_hash[18].to_f / 0.00508
    data_hash[19] = data_hash[19].to_f / 0.00508
    data_hash[20] = data_hash[20].to_f * 2.204623

    data_hash[28] = data_hash[28].to_f * 7
    data_hash[29] = data_hash[29].to_f * 7
    data_hash[30] = data_hash[30].to_f * 1.8 + 32
    data_hash[31] = data_hash[31].to_f * 7
    data_hash[32] = data_hash[32].to_f * 1.8 + 32
    data_hash[33] = data_hash[33].to_f * 7
    data_hash[34] = data_hash[34].to_f * 1.8 + 32
    data_hash[35] = data_hash[35].to_f * 7
    data_hash[36] = data_hash[36].to_f * 1.8 + 32
    data_hash[37] = data_hash[37].to_f * 7

    data_hash[38] = data_hash[38].to_f * 1.8 + 32
    data_hash[39] = data_hash[39].to_f * 7
    data_hash[40] = data_hash[40].to_f * 1.8 + 32
    data_hash[41] = data_hash[41].to_f * 7
    data_hash[42] = data_hash[42].to_f / 1.699

    data_hash[45] = data_hash[45].to_f * 1.8 + 32
    data_hash[46] = data_hash[46].to_f * 7
    data_hash[47] = data_hash[47].to_f * 1.8 + 32
    data_hash[48] = data_hash[48].to_f * 7
    data_hash[53] = data_hash[53].to_f / 0.00508
    data_hash[54] = data_hash[54].to_f / 0.00508
    data_hash[64] = data_hash[64].to_f / 1.699
    data_hash[65] = data_hash[65].to_f / 1.699
    data_hash[66] = data_hash[66].to_f / 1.699
    data_hash[67] = data_hash[67].to_f / 1.699
    data_hash
  end

  def convert_result_to_si data_hash
    data_hash[3] = (data_hash[3] - 32) / 1.8
    data_hash[4] = data_hash[4] / 7
    data_hash[5] = data_hash[5] * 1.699
    data_hash[6] = (data_hash[6] - 32) / 1.8
    data_hash[7] = data_hash[7] / 7
    data_hash[8] = data_hash[8] * 1.699
    data_hash[9] = (data_hash[9] - 32) / 1.8
    data_hash[10] = data_hash[10] / 7
    data_hash[11] = (data_hash[11] - 32) / 1.8
    data_hash[12] = (data_hash[12] - 32) / 1.8
    data_hash[13] = data_hash[13] / 7
    data_hash[14] = data_hash[14] / 1000 * 0.29307107
    data_hash[15] = data_hash[15] / 0.004015
    data_hash[16] = data_hash[16] / 0.004015
    data_hash[17] = data_hash[17] / 0.004015
    data_hash[18] = data_hash[18] * 0.00508
    data_hash[19] = data_hash[19] * 0.00508
    data_hash[20] = data_hash[20] / 2.204623

    data_hash[28] = data_hash[28] / 7
    data_hash[29] = data_hash[29] / 7
    data_hash[30] = (data_hash[30] - 32) / 1.8
    data_hash[31] = data_hash[31] / 7
    data_hash[32] = (data_hash[32] - 32) / 1.8
    data_hash[33] = data_hash[33] / 7
    data_hash[34] = (data_hash[34] - 32) / 1.82
    data_hash[35] = data_hash[35] / 7
    data_hash[36] = (data_hash[36] - 32) / 1.8
    data_hash[37] = data_hash[37] / 7
    data_hash[38] = (data_hash[38] - 32) / 1.8
    data_hash[39] = data_hash[39] / 7
    data_hash[40] = (data_hash[40] - 32) / 1.8
    data_hash[41] = data_hash[41] / 7
    data_hash[42] = data_hash[42] * 1.699
    data_hash[45] = (data_hash[45] - 32) / 1.8
    data_hash[46] = data_hash[46] / 7
    data_hash[47] = (data_hash[47] - 32) / 1.8
    data_hash[48] = data_hash[48] / 7
    data_hash[53] = data_hash[53] * 0.00508
    data_hash[54] = data_hash[54] * 0.00508
    data_hash[64] = data_hash[64] * 1.699
    data_hash[65] = data_hash[65] * 1.699
    data_hash[66] = data_hash[66] * 1.699
    data_hash[67] = data_hash[67] * 1.699
    data_hash
  end
end
