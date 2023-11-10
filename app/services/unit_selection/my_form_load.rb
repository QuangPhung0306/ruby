module UnitSelection::MyFormLoad
  def my_form_load current_user, model_type = nil
    @flagcoefcalc = 0
    @fileflgag = 1
    @pai = 3.1415
    @flagdst = 1
    @flagini = 1


    @jjj = 1
    @dstuc = 1
    @dstur = 1

    data_zero = Array.new(30, 0)

    headers1 = ["Various", "Model", "P (reg)", "Dry air", "Wet air", "By-pass 1", "By-pass 2", "Rot.", "Diam", "Hub",
      "Spokes", "Area", "Thickn.", "Proc", "Pu1", "Reg", "Pu2", "Security margin", "Coefficient", "Rotor"] + data_zero
    headers2 = ["Non",  "Non", "kW", "m3/h", "m3/h", "Andel av (wet air)", "Andel av (wet air)", "rph", "mm", "mm",
      "mm", "m2", "mm", "Andel av Area", "Andel av Area", "Andel av Area", "Andel av Area", "%", "Non",
      "Non (1=D-MAX 200cpsi, 2=D-MAX 300cpsi)"] + data_zero


    @datas ||= if model_type
      M::Unit.send(model_type).includes(:m_category).try(current_user.area)
    else
      M::Unit.includes(:m_category).try(current_user.area)
    end
    @aaaa = [Array.new(headers1.size, 0.0), headers1, headers2]
    @cc = [Array.new(headers1.size, 0.0), Array.new(headers1.size, 0.0), Array.new(headers1.size, 0.0)]

    @datas.each.with_index do |data, index|
      @aaaa << ([data.m_category_name, data.name, data.p_reg.to_f, data.dry_air.to_f, data.wet_air.to_f, data.by_pass1.to_f, data.by_pass2.to_f, data.rot.to_f, data.diam.to_f,
        data.hub.to_f, data.spokes.to_f, data.area.to_f, data.thickn.to_f, data.process.to_f, data.pu1.to_f, data.reg.to_f, data.pu2.to_f, data.security_margin.to_f, data.coefficient.to_f, data.rotor.to_f] + data_zero)

      @cc << ([0.0, 0.0, data.p_reg.to_f, data.dry_air.to_f, data.wet_air.to_f, data.by_pass1.to_f, data.by_pass2.to_f, data.rot.to_f, data.diam.to_f,
        data.hub.to_f, data.spokes.to_f, data.area.to_f, data.thickn.to_f, data.process.to_f, data.pu1.to_f, data.reg.to_f, data.pu2.to_f, data.security_margin.to_f, data.coefficient.to_f, data.rotor.to_f] + data_zero)
    end

    if @aaaa.size < 1000
      data_zero = Array.new((1000-@aaaa.size), Array.new(50, 0.0))
      @aaaa = @aaaa + data_zero
      @cc = @cc + data_zero
    end

    @dstur = @datas.count + 2
    @jjj = @dstur.next
    @combobox2 = "Consorb"
    if @flag >= 1
    else
      @textbox15_enabled = false
      @textbox11_enabled = false
      @textbox9_enabled = false
      @picturebox1 = "1_3.jpg"
    end
    if @flagsys.to_i == 1
    else
      @csa = ((@combobox1.to_f / 1000 / 2)**2) *@pai * 3 / 5
      @csh = ((@combobox1.to_f / 1000 / 2)**2) *@pai * 1 / 5
      @csp = ((@combobox1.to_f / 1000 / 2)**2) *@pai * 1 / 5
    end

    if (@combobox4.to_s == "50")
      @checkbox17_checked = true
    elsif (@combobox4.to_s == "100")
     @checkbox14_checked = true
    elsif (@combobox4.to_s == "200")
     @checkbox15_checked = true
    elsif (@combobox4.to_s == "400")
     @checkbox16_checked = true
    end

     if (@flagsys.to_i == 1)
     else
       if (@textboxd != "")
         @textbox23 = ((@textboxd.to_f) * 3600 * @csa).round(1).to_s
         @textbox29 = ((@textboxd.to_f) * 3600 * @csa / 1.699).round(1).to_s
       end
     end

     if (@textboxe != "")
       @textbox38 = ((@textboxe.to_f) * 3600 * @csh).round(1).to_s
       @textbox32 = ((@textboxe.to_f) * 3600 * @csh / 1.699).round(1).to_s
     end

     if (@flagsys.to_i == 1)
     else
       @textbox22 = ((@textbox16.to_f) * 3600 * @csp).round(1).to_s
       @textbox28 = ((@textbox16.to_f) * 3600 * @csp / 1.699).round(1).to_s
     end

     @textbox48 = (((@textbox10.to_f)) * 1.8 + 32).round(1).to_s
     @textbox26 = ((@textbox6.to_f)*7).round(1).to_s

     if (@textbox7 != "")
       @textbox30 = ((@textbox7.to_f)*7).round(1).to_s
     end
     if (@textbox5 != "")
       @textbox33 = ((@textbox5.to_f)*7).round(1).to_s
     end

     @textbox47 = ((@textbox19.to_f)*7).round(1).to_s

     if (@radiobutton1 == true)
       @textbox23_enabled = true
       @textboxd_enabled = false
     end
     @textbox59 = (((@textbox60.to_f)) * 1.8 + 32).round(1).to_s
     @textbox58 = ((@textbox61.to_f)*7).round(1).to_s

     @dstuc = 2
     # @combobox2_text = "Consorb"
     @flagini = 1
     if (@dsttoolstripmenuitem == "-DST")
       @dsttoolstripmenuitem_visible = true

       @checkbox18_visible = false
       @label137_visible = false
       @label97_visible = false
       @label140_visible = false

       @checkbox5_visible = false
       @checkbox2_visible = false
       @checkbox1_visible = false
       @checkbox1_enabled = false

       @textbox6 = "8"
       @textbox7 = "8"

       @textbox23 = "400"
       @textbox22 = "150"
       @textbox38 = "150"
       @textbox61 = "8"
       @textbox82 = "8"

       @groupbox1 = "C'.Regen Air Inlet"
       @groupbox6 = "D.Purge Air"
       @groupbox7 = "E.Regen Air Inlet"
       @groupbox3 = "F.Regen Air"
       @groupbox8 = "G.Wet Air Outlet"
       @groupbox4 = "B.Dry Air Outlet"

       @groupbox13_visible = false
       @groupbox18_visible = false

       @groupbox19_visible = false

       @textbox38_enabled = false
       @checkbox19 = true
       checkbox19_checkedchanged

       @combobox2_text = ""
       dst_layout()

       if (@dstreptoolstripmenuitem == "-Rep")
         dst_layout()
       end
     end

     if (@flagsys.to_i == 1)
       if (@flag1.to_i == 3)
         @combobox2 = "1:1:3"
       elsif (@flag1.to_i == 4)
         @combobox2 = "1:1:6"
       elsif (@flag1.to_i == 8)
         @combobox2 = "1:1:10"
       end
       @checkbox13_checked = true
       initial_input()
       result()
     end

    @flagini = 0
    initial_calc()
    {combobox1: @combobox1, textboxd: @textboxd, textboxe: @textboxe, textbox16: @textbox16, textbox10: @textbox10, textbox6: @textbox6, textbox7: @textbox7, textbox5: @textbox5, textbox19: @textbox19, textbox60: @textbox60, textbox61: @textbox61, textbox23: @textbox23, textbox29: @textbox29, textbox38: @textbox38, textbox32: @textbox32, textbox22: @textbox22, textbox28: @textbox28, textbox48: @textbox48, textbox26: @textbox26, textbox30: @textbox30, textbox33: @textbox33, textbox47: @textbox47, textbox59: @textbox59, textbox58: @textbox58, textbox82: @textbox82, groupbox13_visible: @groupbox13_visible, groupbox18_visible: @groupbox18_visible, groupbox19_visible: @groupbox19_visible, checkbox19_visible: @checkbox19_visible}
  end
end
