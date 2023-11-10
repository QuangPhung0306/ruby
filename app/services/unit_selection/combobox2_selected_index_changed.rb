module UnitSelection::Combobox2SelectedIndexChanged
  def combobox2_selected_index_changed combobox2
     @combobox2 = combobox2
     if (@flagini == 0)
       @checkbox7 = false
       @checkbox8 = false
       @checkbox9 = false
       @checkbox10 = false
       @checkbox11 = false

       @textbox1_backcolor = "Color::White"
       @textbox2_backcolor = "Color::White"
       @textbox5_backcolor = "Color::White"
       @textbox7_backcolor = "Color::White"
       @textbox8_backcolor = "Color::White"
       @textboxd_backcolor = "Color::White"
       @textboxe_backcolor = "Color::White"

       if (@flagsgj == 3)
         @picturebox1 = "New-SGP.jpg"
         @textbox15_enabled = false
         @textbox4_enabled = false
         @textbox6_enabled = false
         @textbox8_enabled = false
         @textbox9_enabled = false
         @textbox11_enabled = false

         @textbox8 = 20

         area_sgp()

         @checkbox7_enabled = true
         @checkbox8_enabled = true
         @checkbox9_enabled = true
         @checkbox10_enabled = true
         @checkbox11_enabled = true
         @checkbox14_enabled = true
         @checkbox15_enabled = true
         @checkbox16_enabled = true
         @checkbox17_enabled = true

         @label124_visible = false
         @label97_visible = true

         @combobox8_text = ""

         @textbox68 = ((@textbox9) / 360 * 100).to_i
         @textbox69 = ((@textbox11) / 360 * 100).to_i
         @textbox70 = ((@textbox15) / 360 * 100).to_i


       elsif ((@combobox2.to_s) == ("Consorb") || (@combobox2.to_s) == "Others")
         @groupbox1_visible = false
         @groupbox6_visible = false
         @groupbox7_visible = true
         @groupbox16_visible = false

         @checkbox7_enabled = false
         @checkbox8_enabled = false
         @checkbox9_enabled = false
         @checkbox10_enabled = false
         @checkbox11_enabled = false

         @checkbox13 == false

         @checkbox13_enabled = false
         @checkbox14_enabled = false
         @checkbox15_enabled = false
         @checkbox16_enabled = false
         @checkbox17_enabled = false
         @checkbox18 = false
         @checkbox2 = false
         @textbox11_enabled = false

         @radiobutton9 = true
         radiobutton9_checkedchanged

         @textbox68_visible = true
         @textbox69_visible = true
         @textbox70_visible = false
         @textbox71_visible = false
         @label112_visible = true
         @textbox66_visible = false
         @textbox67_visible = false
         @label103_visible = true
         @label104_visible = true
         @label105_visible = false
         @label106_visible = false
         @label107_visible = true
         @label109_visible = true
         @label110_visible = true
         @label118_visible = false
         @label119_visible = false

         @label121_visible = false
         @label123_visible = false
         @label124_visible = true
         @label136_visible = false
         @label137_visible = false

         @combobox1_enabled = false
         @combobox3_enabled = false
         @combobox4_enabled = false

         @picturebox1 = ("1_3.jpg")

         @textbox22_enabled = false
         @textbox79_enabled = true
         @textbox38_enabled = true

         @checkbox5_visible = false
         @checkbox2_visible = false

         if (@checkbox19 == true)
           @textbox10_enabled == false
           @textbox19_enabled == false
           @textbox48_enabled == false
           @textbox47_enabled == false

         end
         @textbox1 = 20.to_s
         @textbox7 = (8.7).round(1).to_s
         @textbox10 = 20.to_s
         @textbox19 = (8.7).round(1).to_s
         @textbox81 = 20.to_s
         @textbox82 = (8.7).round(1).to_s
         @textbox60 = 20.to_s
         @textbox61 = (8.7).round(1).to_s
         @textbox4 = 20.to_s
         @textbox6 = (8.7).round(1).to_s
         @textbox65 = 50.to_s
         initial_calc
         @textbox50 = (0.8).round(1).to_s

         @combobox8 = ""
       elsif (@combobox2.to_s == "Recusorb 1" || @combobox2.to_s == "Recusorb 2")
         if (@combobox2.to_s == "Recusorb 1")
           @picturebox1 = "Recusorb1.jpg"
           @textbox71_visible = false
           @label106_visible = false
           @textbox67_visible = false
           @label119_visible = false
           @groupbox13_visible = false
           @groupbox18_visible = false
         end
         if (@combobox2.to_s == "Recusorb 2")
           @picturebox1 = "Recusorb2.jpg"
           @textbox71_visible = true
           @label106_visible = true
           @textbox67_visible = true
           @label119_visible = true

           @groupbox13_visible = true
           @groupbox18_visible = true
           @label97_visible = true
           @label140_visible = true
           @textbox1_enabled = false
           @textbox7_enabled = false
           @textbox1 = ((@textbox81.to_f*@textbox79.to_f + @textbox60.to_f*@textbox23.to_f) / (@textbox79.to_f + @textbox23.to_f)).round(1).to_s
           @textbox7 = ((@textbox82.to_f*@textbox79.to_f + @textbox61.to_f*@textbox23.to_f) / (@textbox79.to_f + @textbox23.to_f)).round(1).to_s
           @groupbox13_visible = true
           @groupbox18_visible = true
         end
         @groupbox1_visible = true
         @groupbox1 = "C'. Regen Air Inlet"
         @groupbox6_visible = true
         @groupbox7_visible = false
         @groupbox16_visible = true

         @checkbox7_enabled = false
         @checkbox8_enabled = false
         @checkbox9_enabled = true
         @checkbox10_enabled = false
         @checkbox11_enabled = true

         @checkbox13 == false

         @checkbox13_enabled = false
         @checkbox14_enabled = false
         @checkbox15_enabled = false
         @checkbox16_enabled = false
         @checkbox17_enabled = false
         @checkbox18 = false
         @checkbox2 = false
         @checkbox5 = false

         @textbox11_enabled = false
         @textbox22_enabled = false

         @checkbox5_visible = false
         @checkbox2_visible = false

         @radiobutton9 = true
         radiobutton9_checkedchanged

         @textbox68_visible = true
         @textbox69_visible = true
         @textbox70_visible = true
         @label112_visible = true
         @textbox66_visible = true
         @label103_visible = true
         @label104_visible = true
         @label105_visible = true
         @label107_visible = true
         @label109_visible = true
         @label110_visible = true
         @label118_visible = true

         @label121_visible = true
         @label123_visible = true
         @label124_visible = false
         @label136_visible = true
         @label137_visible = true
         @label140_visible = false

         @combobox1_enabled = false
         @combobox3_enabled = false
         @combobox4_enabled = false

         @textbox1 = 20
         @textbox7 = (8.7).round(1).to_s
         @textbox10 = 20
         @textbox19 = (8.7).round(1).to_s
         @textbox61 = (8.7).round(1).to_s
         @textbox82 = (8.7).round(1).to_s
         @textbox22 = (@textbox79).to_f.round(0)

         @combobox8 = ""
       else
         groupBox1_visible = true;
         groupBox6_visible = true;

         checkBox7_enabled = false;
         checkBox8_enabled = false;
         checkBox9_enabled = false;
         checkBox10_enabled = false;
         checkBox11_enabled = false;

         checkBox13_checked = false;

         checkBox13_enabled = false;
         checkBox14_enabled = false;
         checkBox15_enabled = false;
         checkBox16_enabled = false;
         checkBox17_enabled = false;
         checkBox18_checked = false;
         checkBox2_checked = false;

         label121_visible = true;
         label123_visible = true;
         label124_visible = false;

         comboBox1_enabled = false;
         comboBox4_enabled = false;

         this_picturebox1_Image = "1_1_6.jpg"

         textbox1 = "20"
         textbox7 = "8.7"
         textbox10 = "20"
         textbox19 = "8.7"

         combobox8_text = "";
       end

       if @dstuc != 1
         for jjj in (1..@dstur) do
          if @combobox2 == @aaaa[jjj][0]
             @combobox8_items = @aaaa[jjj][1]
           end
         end
       end
       initial_input
       initial_calc
     end
  end
end
