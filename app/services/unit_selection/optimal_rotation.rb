module UnitSelection::OptimalRotation
  def optimal_rotation
    case
    when @combobox2.to_s == "Consorb"
      if (@textbox2 != "-")
        if (@textboxd != "")
          if (@textboxe != "")
            if (@textbox68 != "")
              @optrot = -47.7862 + 1.101047 * @textboxd.to_f + 4.207031 * @textboxe.to_f - 0.08414 * @combobox4.to_f + 0.318876 * @textbox2.to_f + 0.985399 * @textbox69.to_f + 0.178432 * @textbox1.to_f + 0.052374 * @textbox7.to_f
            end
          end
        end
      end
    when (@combobox2.to_s == "Recusorb 1") || (@combobox2.to_s == "Recusorb 2")
      if (@radiobutton8 == true)
        if (@textboxd != "")
          if (@textboxe != "")
            if (@textbox68 != "")
              raise "textbox66 is not number" if @textbox66.to_s == "" || !@textbox66.match(Settings.regex.float_number)
              @optrot = 18.35368 + 0.363995 * @textboxd.to_f + 3.145849 * @textboxe.to_f - 0.08505 * @combobox4.to_f + 0.058269 * @textbox2.to_f - 0.22615 * @textbox68.to_f + 0.746913 * @textbox69.to_f + 0.51402 * @textbox1.to_f - 0.17673 * @textbox7.to_f - 0.15956 * @textbox66.to_f + 0.239507 * @textbox6.to_f
            end
          end
        end
      elsif (@radiobutton9 == true)
        if (@textboxd != "")
          if (@textboxe != "")
            if (@textbox68 != "")
              raise "textbox66 is not number" if @textbox66.to_s == "" || !@textbox66.match(Settings.regex.float_number)
              @optrot = 1.04364 + 0.262117 * @textboxd.to_f + 4.101062 * @textboxe.to_f - 0.08916 * @combobox4.to_f + 506.285 * @textbox50.to_f / @textbox79.to_f - 0.22671 * @textbox68.to_f + 1.152697 * @textbox69.to_f + 0.583759 * @textbox1.to_f - 0.31217 * @textbox7.to_f - 0.20624 * @textbox66.to_f + 0.367653 * @textbox6.to_f
            end
          end
        end
      end
    else
      if (@textboxd != "")
        if (@textboxe != "")
          @textbox8 = (4.0* 400.0 / @combobox4.to_f*((@textboxe.to_f) + (@textboxe.to_f)) / 2.0).round(0).to_s
        end
      end
      if (@combobox3.to_f == "D-MAX 200cpsi" || @combobox3.to_f == "D-MAX 250cpsi")
        @textbox8 = (0.875*@textbox8.to_f).round(0).to_s
       end
      if (@combobox3.to_f == "D-MAX 300cpsi" || @combobox3.to_f == "D-MAX 350cpsi" || @combobox3.to_f == "D-MAX 400cpsi")
        @textbox8 = (0.875*@textbox8.to_f).round(0).to_s
      end
    end
  end
end
