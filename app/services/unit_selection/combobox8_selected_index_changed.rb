module UnitSelection::Combobox8SelectedIndexChanged
  def combobox8_selected_index_changed combobox8
    @combobox8 = combobox8
    @flagini = 1
    @radiobutton1 = true
    @checkbox2 = false

    for ijk in (1..500) do
      if @combobox8 == @aaaa[ijk][1]
        @dstunit = ijk
      end
    end
    @checkbox5 = false
    checkbox5_checkedchanged
    if @cc[@dstunit][8].round(0) == @combobox1
      @combobox1 = @cc[@dstunit][8].round(0).to_s
    else
      @combobox1 = @cc[@dstunit][8].round(0).to_s
      combobox1_selected_index_changed
    end
    
    if @cc[@dstunit][12].round(0) == @combobox4
      @combobox4 = @cc[@dstunit][12].round(0).to_s
    else
      @combobox4 = @cc[@dstunit][12].round(0).to_s
      combobox4_selected_index_changed
    end
    @textbox8 = @cc[@dstunit][7].round(0).to_s
    @textbox62 = (@cc[@dstunit][17]).round(0).to_s
    @textbox50 = @cc[@dstunit][2].round(2).to_s
    @textbox49 = ((@textbox50.to_f) * 1000 / 0.29307107).round(1).to_s

    @textbox68 = (@cc[@dstunit][13] * 100).round(1).to_s
    @textbox69 = (@cc[@dstunit][15] * 100).round(1).to_s
    @textbox70 = (@cc[@dstunit][14] * 100).round(1).to_s
    @textbox71 = (@cc[@dstunit][16] * 100).round(1).to_s
    @label112 = (@cc[@dstunit][11]).round(2).to_s
    @textbox66 = (@cc[@dstunit][5] * 100).round(0).to_s
    @textbox67 = (@cc[@dstunit][6] * 100).round(0).to_s

    @csa = @cc[@dstunit][11] * @cc[@dstunit][13]
    @csh = @cc[@dstunit][11] * @cc[@dstunit][15]
    @csp = @cc[@dstunit][11] * @cc[@dstunit][14]
    @csp2 = @cc[@dstunit][11] * @cc[@dstunit][16]
    if (@checkbox23 == true)
      @textbox79 = @cc[@dstunit][4].round(0).to_s
      @textbox78 = ((@textbox79.to_f) / 1.699).round(0).to_s
      @textbox65 = @cc[@dstunit][4].round(0).to_s
      @textbox83 = ((@textbox65.to_f) / 1.699).round(0).to_s
    else
     @textbox23 = @cc[@dstunit][3].round(0).to_s
     @textbox29 = ((@textbox23.to_f) / 1.699).round(0).to_s
     @textbox80 = @cc[@dstunit][3].round(0).to_s
     @textbox88 = ((@textbox80.to_f) / 1.699).round(0).to_s
     @textbox38 = @cc[@dstunit][4].round(0).to_s
     @textbox32 = ((@textbox38.to_f) / 1.699).round(0).to_s
     @textbox65 = @cc[@dstunit][4].round(0).to_s
     @textbox83 = ((@textbox65.to_f) / 1.699).round(0).to_s
     @textbox79 = @cc[@dstunit][4].round(0).to_s
     @textbox78 = ((@textbox79.to_f) / 1.699).round(0).to_s
     @textbox76 = @cc[@dstunit][4].round(0).to_s
     @textbox85 = ((@textbox76.to_f) / 1.699).round(0).to_s

     @textbox22 = (@cc[@dstunit][4] - @cc[@dstunit][4] * @cc[@dstunit][5] - @cc[@dstunit][4] * @cc[@dstunit][6]).round(0).to_s
     @textbox28 = ((@textbox22.to_f) / 1.699).round(0).to_s
    end

    @textbox9 = (360 * @cc[@dstunit][13]).round(0).to_s
    @textbox15 = (360 * @cc[@dstunit][14]).round(0).to_s
    @textbox11 = (360 * @cc[@dstunit][15]).round(0).to_s

    @oatg = (@textbox10.to_f) + 273.15
    if (@cc[@dstunit][19]==1)
     @combobox3 = "D-MAX 200cpsi"
    elsif (@cc[@dstunit][19] == 2)
     @combobox3 = "D-MAX 300cpsi"
    end

    @energyh = (@textbox50.to_f)

    if (@textbox5 == "-")
     @xbh = (@textbox6.to_f) / 1000.0
    else
     @xbh = (@textbox5.to_f) / 1000.0
    end

    @cf = 1040.0
    @uh = (@textboxe.to_f)
    @htg = @oatg + @energyh*(273.15 + 20)*(4.555*(0.622 + @xbh)) * 101.32 / (1000 * (@label139.to_f) / 10) * 1000 / @cf / @uh / @csh
    if ((@combobox2.to_s) == "Consorb" || (@combobox2.to_s) == "Others")
     @textbox2 = (@htg - 273.15).round(1).to_s
     @radiobutton9 = true
     radiobutton9_checkedchanged

     if ((@combobox8.to_s) == "CS-5" || (@combobox8.to_s) == "CS-5L")
       @picturebox1 = ("Consorb_mix.jpg")
       @groupbox1_visible = true
       @groupbox1 = "C. Regen Air Inlet"
       @groupbox13_visible = true
       @groupbox18_visible = true
       @label97_visible = true
       @label136_visible = true
       @label140_visible = true
       @textbox1_enabled = false
       @textbox7_enabled = false
       @textbox1 = (((@textbox81.to_f)*(@textbox79.to_f) + (@textbox60.to_f)*(@textbox23.to_f)) / ((@textbox79.to_f) + (@textbox23.to_f))).round(1).to_s
       @textbox7 = (((@textbox82.to_f)*(@textbox79.to_f) + (@textbox61.to_f)*(@textbox23.to_f)) / ((@textbox79.to_f) + (@textbox23.to_f))).round(1).to_s
       @checkbox4_enabled = false
       @checkbox6_enabled = false
       @textbox65_enabled = false

       @checkbox19_visible = false
       @checkbox19 = false

       @textbox10_enabled = false
       @textbox19_enabled = false


       @textbox10 = (@textbox4.to_f).round(1).to_s
       @textbox19 = (@textbox6.to_f).round(1).to_s

       @textbox38_enabled = false
       @checkbox4 = true
       @textbox5_enabled = false
       @textbox79_enabled = false
       @textbox23_enabled = false

     else
       @picturebox1 = ("1_3.jpg")
       @groupbox1_visible = false
       @groupbox13_visible = false
       @groupbox18_visible = false
       @label97_visible = false
       @label136_visible = false
       @label140_visible = false
       @textbox1_enabled = true
       @textbox7_enabled = true
       @checkbox4_enabled = true
       @checkbox6_enabled = true
       @textbox38_enabled = false

       @checkbox19_visible = true
       @checkbox19 = true
       @checkbox4 = false
       @checkbox1 = false
       @textbox5_enabled = false
       @textbox79_enabled = true
       @textbox23_enabled = true
       @textbox65_enabled = true
     end
    else
     @textbox2 = "-"
     @textbox34 = "-"
     @radiobutton9 = true
     radiobutton9_checkedchanged
     @textbox38_enabled = false
     if ((@combobox2.to_s) == "Recusorb 1")
       if ((@combobox8.to_s) == "DR-010 B" || (@combobox8.to_s) == "DR-20B" || (@combobox8.to_s) == "DR-30D" || (@combobox8.to_s) == "DR-40-T10" || (@combobox8.to_s) == "DR-40-T16" || (@combobox8.to_s) == "DR-50 R")
         @picturebox1 = ("Recusorb1_mix.jpg")
         @groupbox13_visible = true
         @groupbox18_visible = true
         @label97_visible = true
         @label140_visible = true
         @textbox1_enabled = false
         @textbox7_enabled = false
         @textbox1 = (((@textbox81.to_f)*(@textbox79.to_f) + (@textbox60.to_f)*(@textbox23.to_f)) / ((@textbox79.to_f) + (@textbox23.to_f))).round(1).to_s
         @textbox7 = (((@textbox82.to_f)*(@textbox79.to_f) + (@textbox61.to_f)*(@textbox23.to_f)) / ((@textbox79.to_f) + (@textbox23.to_f))).round(1).to_s

         @checkbox4 = true
         @checkbox4_enabled = false
         @checkbox6_enabled = false
         @textbox10_enabled = false
         @textbox19_enabled = false

         @textbox10 = (@textbox4).to_f.round(1).to_s
         @textbox19 = (@textbox6).to_f.round(1).to_s

         @textbox5_enabled = false
         @textbox79_enabled = false
         @textbox23_enabled = false
       else
         @picturebox1 = ("Recusorb1.jpg")
         @groupbox13_visible = false
         @groupbox18_visible = false
         @label97_visible = false
         @label140_visible = false
         @textbox1_enabled = true
         @textbox7_enabled = true
         @checkbox4_enabled = true
         @checkbox6_enabled = true
         @textbox10_enabled = true
         @textbox19_enabled = true

         @textbox5_enabled = false
         @textbox79_enabled = true
         @textbox23_enabled = true
       end
     end

    end
    initial_calc true
  end
end
