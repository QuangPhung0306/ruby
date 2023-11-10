module UnitSelection::Combobox1SelectedIndexChanged
  def combobox1_selected_index_changed
    if (@radiobutton5 == true)
      if (@radiobutton2 == true)
        if (@textboxd != "")
          @textbox23 = (@textboxd.to_f * 3600 * @csa).round(1).to_s
          @textbox29 = (@textboxd.to_f * 3600 * @csa / 1.699).round(1).to_s
        end
        if (@textboxe != "")
          @textbox38 = (@textboxe.to_f * 3600 * @csh).round(1).to_s
          @textbox32 = (@textboxe.to_f * 3600 * @csh / 1.699).round(1).to_s
        end
        @textbox22 = (@textbox16.to_f * 3600 * @csp).round(1).to_s
        @textbox28 = (@textbox16.to_f * 3600 * @csp / 1.699).round(1).to_s
      elsif (@radiobutton1 == true)
        if (@textbox23 != "")
          @textboxd = (@textbox23.to_f / 3600 / @csa).round(1).to_s
          @textbox29 = (@textbox23.to_f / 1.699).round(1).to_s
        end
      end
    end

    if (@radiobutton6 == true)
      if (@radiobutton2 == true)
        if (@textboxd != "")
          @textboxd = (@textbox29.to_f*1.699 / 3600 / @csa).round(1).to_s
          @textbox23 = (@textboxd.to_f * 3600 * @csa).round(1).to_s
        end
        if (@textboxe != "")
          textboxe = (@textbox32.to_f * 1.699 / 3600 / @csh).round(1)
          @textboxe = textboxe == Float::INFINITY ? Float::INFINITY : Float::INFINITY.to_s
          @textbox38 = (@textbox32.to_f *  1.699).round(1).to_s
        end
        @textbox22 = (@textbox16.to_f * 3600 * @csp).round(1).to_s
        @textbox28 = (@textbox16.to_f * 3600 * @csp / 1.699).round(1).to_s

      elsif (@radiobutton1 == true)
        if (@textbox29 != "")
          @textboxd = (@textbox29.to_f * 1.699 / 3600 / @csa).round(1).to_s
          @textbox23 = (@textbox29.to_f * 1.699).round(1).to_s
        end
        if (@textbox32 != "")
          textboxe = (@textbox32.to_f * 1.699 / 3600 / @csh).round(1)
          
          @textboxe = textboxe == Float::INFINITY ? Float::INFINITY : Float::INFINITY.to_s
          @textbox38 = (@textbox32.to_f * 1.699).round(1).to_s
        end
        @textbox22 = (@textbox16.to_f * 3600 * @csp).round(1).to_s
        @textbox28 = (@textbox16.to_f * 3600 * @csp / 1.699).round(1).to_s
      end
    end
  end
end
