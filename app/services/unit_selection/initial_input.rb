module UnitSelection::InitialInput
  def initial_input
     @flaginput = 1

     @okinput = 1
     okrange()
     @okinput = 0

     if (@radiobutton5 == true)

       if (@checkbox4 == true)
         @textbox6_enabled = false
       else
         @textbox6_enabled = true
       end

       if (@checkbox6 == true)
         @textbox4_enabled = false
       else
         @textbox4_enabled = true
       end


       @label13_visible = true
       @label14_visible = true
       @label23_visible = true
       @label31_visible = true
       @label37_visible = true
       @label98_visible = true

       @textboxd_visible = true
       @textboxe_visible = true
       @textbox1_visible = true
       @textbox2_visible = true
       @textbox4_visible = true
       @textbox5_visible = true
       @textbox6_visible = true
       @textbox7_visible = true
       @textbox10_visible = true
       @textbox12_visible = true
       @textbox16_visible = true
       @textbox17_visible = true
       @textbox19_visible = true
       @textbox20_visible = true
       @textbox21_visible = true
       @textbox23_visible = true
       @textbox38_visible = true
       @textbox50_visible = true
       @textbox52_visible = true
       @textbox55_visible = true
       @textbox56_visible = true
       @textbox60_visible = true
       @textbox61_visible = true
       @textbox64_visible = true
       @textbox65_visible = true
       @textbox73_visible = true
       @textbox80_visible = true


       @label150_visible = false
       @label151_visible = false
       @label152_visible = false

       @textbox24_visible = false
       @textbox25_visible = false
       @textbox26_visible = false
       @textbox27_visible = false
       @textbox28_visible = false
       @textbox29_visible = false
       @textbox30_visible = false
       @textbox31_visible = false
       @textbox32_visible = false
       @textbox33_visible = false
       @textbox34_visible = false
       @textbox36_visible = false
       @textbox37_visible = false
       @textbox47_visible = false
       @textbox48_visible = false
       @textbox49_visible = false
       @textbox51_visible = false
       @textbox53_visible = false
       @textbox54_visible = false
       @textbox58_visible = false
       @textbox59_visible = false
       @textbox72_visible = false
       @textbox83_visible = false
       @textbox84_visible = false
       @textbox88_visible = false
       @textbox89_visible = false
       @textbox90_visible = false
       @textbox91_visible = false



       if (@flagsgj == 3)
         @textbox1_enabled = false
         @textbox4_enabled = false
         @textbox6_enabled = false
         @textbox7_enabled = false
         @textbox9_enabled = false
         @textbox11_enabled = false
         @textbox15_enabled = false
         @textbox16_enabled = false
         @textbox80_enabled = true

         @checkbox10 = false

         @checkbox1_enabled = true
         @checkbox4_enabled = true
         @checkbox5_enabled = true
         @checkbox7_enabled = true
         @checkbox8_enabled = true
         @checkbox9_enabled = true
         @checkbox10_enabled = true
         @checkbox11_enabled = true

         @checkbox14_enabled = true
         @checkbox15_enabled = true
         @checkbox16_enabled = true
         @checkbox17_enabled = true

         @groupbox6_visible = true
         @groupbox7_visible = true
         @groupbox13_visible = true

         @textbox9_visible = false
         @textbox11_visible = false
         @textbox15_visible = false
         @textbox66_visible = false
         @textbox67_visible = false
         @textbox68_visible = false
         @textbox69_visible = false
         @textbox70_visible = false
         @textbox71_visible = false
         @textbox79_visible = false

         @label12_visible = false
         @label32_visible = false
         @label93_visible = false
         @label94_visible = false
         @label103_visible = false
         @label104_visible = false
         @label105_visible = false
         @label106_visible = false
         @label107_visible = false
         @label109_visible = false
         @label110_visible = false
         @label112_visible = false
         @label116_visible = true
         @label117_visible = false
         @label118_visible = false
         @label119_visible = false
         @label124_visible = false
         @label128_visible = false
         @label132_visible = false
         @label134_visible = false
         @label135_visible = false

         @label22 = "CMH"
         @label33 = "CMH"
         @label35 = "CMH"
         @label59 = "CMH"
         @label111 = "CMH"
         @label134 = "CMH"

         @combobox8_text = ""

         if (@sgpsalestoolstripmenuitem == "-Sales")
           @groupbox1_visible = false
           @groupbox16_visible = false
         else
           @groupbox1_visible = true
           @groupbox16_visible = true
         end

         if (@radiobutton1 == true)
           @checkbox2_enabled = false

           @textbox22_enabled = true
           @textbox23_enabled = false
           @textbox65_enabled = true
           @textbox79_enabled = true
           @textbox80_enabled = true
           @textboxe_enabled = false
           @textboxd_enabled = false
         elsif (@radiobutton2 == true)
           @checkbox2_enabled = true

           @textbox22_enabled = false
           @textbox23_enabled = false
           @textbox65_enabled = false
           @textbox79_enabled = false
           @textbox80_enabled = false
           @textboxe_enabled = true
           @textboxd_enabled = true
         end

         @label114_visible = false
         @label115_visible = true

         @textbox72_visible = false
         @textbox73_visible = true
       elsif (@flagdst == 1)
         @label65_visible = false
         @label128_visible = true
         @label129_visible = true
         @label132_visible = true
         if ((@combobox8) == "CS-5" || (@combobox8) == "CS-5L")
           @label132_visible = true

           @textbox1_enabled = false
           @textbox4_enabled = false
           @textbox6_enabled = false
           @textbox7_enabled = false
           @textbox23_enabled = false
           @textbox26_enabled = false
           @textbox27_enabled = false
           @textbox29_enabled = false
           @textbox31_enabled = false
           @textbox32_enabled = false
           @textbox78_enabled = false
           @textbox79_enabled = false

           @textbox58_enabled = true
           @textbox59_enabled = true
           @textbox60_enabled = true
           @textbox61_enabled = true
           @textbox76_enabled = true
           @textbox80_enabled = true
           @textbox81_enabled = true
           @textbox82_enabled = true
           @textbox85_enabled = true
           @textbox86_enabled = true
           @textbox87_enabled = true
           @textbox88_enabled = true
         end

         if ((@combobox2) == "Recusorb 1" || (@combobox2) == "Recusorb 2")
           @label117_visible = true
           @label132_visible = true
           @label133_visible = false

           @textbox22_visible = true
           @textbox28_visible = false
           @textbox78_visible = false

           if ((@combobox8) == "DR-010 B" || (@combobox8) == "DR-20B" || (@combobox8) == "DR-30D" || (@combobox8) == "DR-40-T10" || (@combobox8) == "DR-40-T16" || (@combobox8) == "DR-50 R" || (@combobox2) == "Recusorb 2")
             @label132_visible = true

             @textbox1_enabled = false
             @textbox4_enabled = false
             @textbox6_enabled = false
             @textbox7_enabled = false
             @textbox23_enabled = false
             @textbox26_enabled = false
             @textbox27_enabled = false
             @textbox29_enabled = false
             @textbox31_enabled = false
             @textbox32_enabled = false
             @textbox78_enabled = false
             @textbox79_enabled = false

             @textbox58_enabled = true
             @textbox59_enabled = true
             @textbox60_enabled = true
             @textbox61_enabled = true
             @textbox76_enabled = true
             @textbox80_enabled = true
             @textbox81_enabled = true
             @textbox82_enabled = true
             @textbox85_enabled = true
             @textbox86_enabled = true
             @textbox87_enabled = true
             @textbox88_enabled = true
           else
             @textbox22_enabled = false
           end
         end

         @textbox5_enabled = false
         @textbox33_enabled = false

         if (@radiobutton9 == true)
           @textbox50_enabled = true
           @textbox49_enabled = true
           @textbox2_enabled = false
           @textbox34_enabled = false
         elsif (@radiobutton8 == true)
           @textbox50_enabled = false
           @textbox49_enabled = false
           @textbox2_enabled = true
           @textbox34_enabled = true
         end
       end

     elsif (@radiobutton6 == true)

       if (@checkbox4 == true)
         @textbox26_enabled = false
       else
         @textbox26_enabled = true
       end

       if (@checkbox6 == true)
         @textbox27_enabled = false
       else
         @textbox27_enabled = true
       end


       @label13_visible = false
       @label14_visible = false
       @label23_visible = false
       @label31_visible = false
       @label37_visible = false
       @label98_visible = false

       @textboxd_visible = false
       @textboxe_visible = false
       @textbox1_visible = false
       @textbox2_visible = false
       @textbox4_visible = false
       @textbox5_visible = false
       @textbox6_visible = false
       @textbox7_visible = false
       @textbox10_visible = false
       @textbox12_visible = false
       @textbox16_visible = false
       @textbox17_visible = false
       @textbox19_visible = false
       @textbox20_visible = false
       @textbox21_visible = false
       @textbox23_visible = false
       @textbox38_visible = false
       @textbox50_visible = false
       @textbox52_visible = false
       @textbox55_visible = false
       @textbox56_visible = false
       @textbox60_visible = false
       @textbox61_visible = false
       @textbox64_visible = false
       @textbox65_visible = false
       @textbox73_visible = false
       @textbox80_visible = false


       @label150_visible = true
       @label151_visible = true
       @label152_visible = true

       @textbox24_visible = true
       @textbox25_visible = true
       @textbox26_visible = true
       @textbox27_visible = true
       @textbox28_visible = true
       @textbox29_visible = true
       @textbox30_visible = true
       @textbox31_visible = true
       @textbox32_visible = true
       @textbox33_visible = true
       @textbox34_visible = true
       @textbox36_visible = true
       @textbox37_visible = true
       @textbox47_visible = true
       @textbox48_visible = true
       @textbox49_visible = true
       @textbox51_visible = true
       @textbox53_visible = true
       @textbox54_visible = true
       @textbox58_visible = true
       @textbox59_visible = true
       @textbox72_visible = true
       @textbox83_visible = true
       @textbox84_visible = true
       @textbox88_visible = true
       @textbox89_visible = true
       @textbox90_visible = true
       @textbox91_visible = true


       @textbox27_enabled = true
       @textbox26_enabled = true
       @textbox28_enabled = false
       @textbox31_enabled = true
       @textbox30_enabled = true
       if (@checkbox19)
         @textbox48_enabled = false
         @textbox47_enabled = false
       else
         @textbox48_enabled = true
         @textbox47_enabled = true
       end


       @textbox4_enabled = false
       @textbox6_enabled = false
       @textbox22_enabled = false
       @textbox1_enabled = false
       @textbox7_enabled = false
       @textbox2_enabled = false
       @textbox38_enabled = false


       if (@flagsgj == 3)
         @label114_visible = true
         @label115_visible = false

         @textbox72_visible = true
         @textbox73_visible = false
       elsif (@flagdst == 1)

         @label128_visible = false
         @label129_visible = false
         @textboxd_enabled = false
         if ((@combobox8) == "CS-5" || (@combobox8) == "CS-5L")
           @label132_visible = false

           @textbox1_enabled = false
           @textbox4_enabled = false
           @textbox6_enabled = false
           @textbox7_enabled = false
           @textbox23_enabled = false
           @textbox26_enabled = false
           @textbox27_enabled = false
           @textbox28_enabled = false
           @textbox29_enabled = false
           @textbox30_enabled = false
           @textbox31_enabled = false
           @textbox32_enabled = false
           @textbox78_enabled = false
           @textbox79_enabled = false
           @textbox89_enabled = false

           @textbox58_enabled = true
           @textbox59_enabled = true
           @textbox60_enabled = true
           @textbox61_enabled = true
           @textbox76_enabled = true
           @textbox80_enabled = true
           @textbox81_enabled = true
           @textbox82_enabled = true
           @textbox85_enabled = true
           @textbox86_enabled = true
           @textbox87_enabled = true
           @textbox88_enabled = true
         else
           @textbox29_enabled = true
         end

         if ((@combobox2) == "Recusorb 1" || (@combobox2) == "Recusorb 2")

           @label117_visible = false
           @label132_visible = false
           @label133_visible = true

           @textbox22_visible = false
           @textbox28_visible = true
           @textbox78_visible = true

           if ((@combobox8) == "DR-010 B" || (@combobox8) == "DR-20B" || (@combobox8) == "DR-30D" || (@combobox8) == "DR-40-T10" || (@combobox8) == "DR-40-T16" || (@combobox8) == "DR-50 R" || (@combobox2) == "Recusorb 2")
             @label132_visible = false

             @textbox1_enabled = false
             @textbox4_enabled = false
             @textbox6_enabled = false
             @textbox7_enabled = false
             @textbox23_enabled = false
             @textbox27_enabled = false
             @textbox26_enabled = false
             @textbox28_enabled = false
             @textbox29_enabled = false
             @textbox30_enabled = false
             @textbox31_enabled = false
             @textbox32_enabled = false
             @textbox78_enabled = false
             @textbox79_enabled = false
             @textbox89_enabled = false

             @textbox58_enabled = true
             @textbox59_enabled = true
             @textbox60_enabled = true
             @textbox61_enabled = true
             @textbox76_enabled = true
             @textbox80_enabled = true
             @textbox81_enabled = true
             @textbox82_enabled = true
             @textbox85_enabled = true
             @textbox86_enabled = true
             @textbox87_enabled = true
             @textbox88_enabled = true
             @textbox91_enabled = false
           else
             if (@checkbox6 == true)
               @textbox27_enabled = false
             else
               @textbox27_enabled = true
             end

             if (@checkbox4 == true)
               @textbox26_enabled = false
             else
               @textbox26_enabled = true
             end
             @textbox28_enabled = false
             @textbox29_enabled = true
             @textbox78_enabled = true
             @textbox89_enabled = false
             @textbox91_enabled = false
             @textboxd_enabled = false
           end
         end

         @textbox5_enabled = false
         @textbox33_enabled = false

         if (@radiobutton9 == true)
           @textbox50_enabled = true
           @textbox49_enabled = true
           @textbox2_enabled = false
           @textbox34_enabled = false
         elsif (@radiobutton8 == true)
           @textbox50_enabled = false
           @textbox49_enabled = false
           @textbox2_enabled = true
           @textbox34_enabled = true
         end
       end

       # @checkbox12 = true

       @textbox10_enabled = false
       @textbox19_enabled = false
       @textbox48_enabled = true
       @textbox47_enabled = false

       # result()
     end

     if (@dstreptoolstripmenuitem == "-Rep")
       @label14_visible = false
       @label98_visible = false
       @label151_visible = false

       @textboxe_visible = false
       @textbox90_visible = false
     end

     @flaginput = 0
  end
end
