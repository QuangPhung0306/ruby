module UnitSelection::PressureDropCalc
  def pressure_drop_calc
    if (@combobox3.to_s == "SSCR AS-31" || @combobox3.to_s == "SSCR-XL" || @combobox3.to_s == "SZCR AS-31" || @combobox3.to_s == "DLR AS-31")
      @textbox55 = ((127.077 + 0.98006*(@itgc + @atgoutave - 273.15) / 2)*@iu*@rheight / 0.4).round(0).to_s
      @textbox56 = ((127.077 + 0.98006*(@htg - 273.15 + @htgoutave - 273.15) / 2)*@uh*@rheight / 0.4).round(0).to_s
      @ppre = ((127.077 + 0.98006*(@ptg - 273.15 + @ptgoutave - 273.15) / 2)*@up*@rheight / 0.4)
      if (@flagdst == 1)
        @textbox55 = ((127.077 + 0.98006*(@itgc + @atgoutave - 273.15) / 2)*@iu*@rheight / 0.4 * 1.1).round(0).to_s
        @textbox56 = ((127.077 + 0.98006*(@htg - 273.15 + @htgoutave - 273.15) / 2)*@uh*@rheight / 0.4 * 1.1).round(0).to_s
        @ppre = ((127.077 + 0.98006*(@ptg - 273.15 + @ptgoutave - 273.15) / 2)*@up*@rheight / 0.4 * 1.1)
      end

      @textbox54 = (0.004015*@textbox55.to_f).round(2).to_s
      @textbox53 = (0.004015*@textbox56.to_f).round(2).to_s
      if (@flag1 == 1 || @flag1 == 2 || @combobox2.to_s == "Consorb")
        @textbox73 = "-"
        @textbox72 = "-"
      else
        @textbox73 = @ppre.round(0).to_s
        @textbox72 = (0.004015*@textbox73.to_f).round(2).to_s
      end
    elsif (@combobox3.to_s == "D-MAX 200cpsi" || @combobox3.to_s == "D-MAX 250cpsi")
      @textbox55 = ((0.8644 + 0.0066*(@itgc + @atgoutave - 273.15) / 2)*(73.462*@iu - 0.00157)*@rheight / 0.2).round(0).to_s
      @textbox56 = ((0.8644 + 0.0066*(@htg - 273.15 + @htgoutave - 273.15) / 2)*(73.462*@uh - 0.00157)*@rheight / 0.2).round(0).to_s
      @ppre = ((0.8644 + 0.0066*(@ptg - 273.15 + @ptgoutave - 273.15) / 2)*(73.462*@up - 0.00157)*@rheight / 0.2)
      if (@flagdst == 1)
        @textbox55 = ((0.8644 + 0.0066*(@itgc + @atgoutave - 273.15) / 2)*(73.462*@iu - 0.00157)*@rheight / 0.2 * 1.1).round(0).to_s
        @textbox56 = ((0.8644 + 0.0066*(@htg - 273.15 + @htgoutave - 273.15) / 2)*(73.462*@uh - 0.00157)*@rheight / 0.2 * 1.1).round(0).to_s
        @ppre = ((0.8644 + 0.0066*(@ptg - 273.15 + @ptgoutave - 273.15) / 2)*(73.462*@up - 0.00157)*@rheight / 0.2 * 1.1)
      end

      @textbox54 = (0.004015*@textbox55.to_f).round(2).to_s
      @textbox53 = (0.004015*@textbox56.to_f).round(2).to_s
      if (@flag1 == 1 || @flag1 == 2 || @combobox2.to_s == "Consorb")
        @textbox73 = "-"
        @textbox72 = "-"
      else
        @textbox73 = @ppre.round(0).to_s
        @textbox72 = (0.004015*@textbox73.to_f).round(2).to_s
      end
    elsif (@combobox3.to_s == "D-MAX 300cpsi" || @combobox3.to_s == "D-MAX 350cpsi" || @combobox3.to_s == "D-MAX 400cpsi")
      @textbox55 = ((0.8644 + 0.0066*(@itgc + @atgoutave - 273.15) / 2)*(71 * @iu)*@rheight / 0.1).round(0).to_s rescue Float::NAN
      @textbox56 = ((0.8644 + 0.0066*(@htg - 273.15 + @htgoutave - 273.15) / 2)*(71 * @uh)*@rheight / 0.1).round(0).to_s rescue Float::NAN
      @ppre = (0.8644 + 0.0066*(@ptg - 273.15 + @ptgoutave - 273.15) / 2)*(71 * @up)*@rheight / 0.1

      @textbox54 = (0.004015*@textbox55.to_f).round(2).to_s
      @textbox53 = (0.004015*@textbox56.to_f).round(2).to_s
      if (@flag1 == 1 || @flag1 == 2 || @combobox2.to_s == "Consorb")
        @textbox73 = "-"
        @textbox72 = "-"
      else
        @textbox73 = @ppre.round(0).to_s rescue Float::NAN
        @textbox72 = (0.004015*@textbox73.to_f).round(2).to_s
      end

      if (@combobox4.to_s == "50")
        @textbox55 = ((0.8644 + 0.0066*(@itgc + @atgoutave - 273.15) / 2)*(39 * @iu)).round(0).to_s rescue Float::NAN
        @textbox54 = (0.004015*@textbox55.to_f).round(2).to_s
        @textbox56 = ((0.8644 + 0.0066*(@htg - 273.15 + @htgoutave - 273.15) / 2)*(39 * @uh)).round(0).to_s rescue Float::NAN
        @textbox53 = (0.004015*@textbox56.to_f).round(2).to_s
        @ppre = (0.8644 + 0.0066*(@ptg - 273.15 + @ptgoutave - 273.15) / 2)*(39 * @up)
        if (@flag1 == 1 || @flag1 == 2 || @combobox2.to_s == "Consorb")
          @textbox73 = "-"
          @textbox72 = "-"
        else
          @textbox73 = @ppre.round(0).to_s rescue Float::NAN
          @textbox72 = (0.004015*@textbox73.to_f).round(2).to_s
        end
      end
    end
  end
end
