module UnitSelection::Checkbox5CheckedChanged
  def checkbox5_checkedchanged
    if (@checkbox5 == true)
       if (@radiobutton1 == true)
         if (@textboxd != "")
           @textbox16 = @textboxd
         end
         @textbox22_enabled = false
         @textbox16_enabled = false
         @textbox28_enabled = false
         if (@textbox16.to_s != "")
           @textbox22 = (@textbox16.to_f * 3600 * csh).round(1).to_s
           @textbox28 = (@textbox16.to_f * 3600 * csh / 1.699).round(1).to_s
         end
       end
       if (@radiobutton2 == true)
         if (@textboxd != "")
           @textbox16 = @textboxd
         end
         @textbox16_enabled = false
         @textbox22_enabled = false
         @textbox28_enabled = false
       end
     else
       if (@radiobutton2 == true)
         @textbox16_enabled = true
         @textbox22_enabled = false
         @textbox28_enabled = false
       elsif (@radiobutton1 == true)
         if (@radiobutton5 == true)
           @textbox16_enabled = false
           @textbox22_enabled = true
           @textbox28_enabled = false
         end
         if (@radiobutton6 == true)
           @textbox16_enabled = false
           @textbox22_enabled = false
           @textbox28_enabled = true
         end
       end
     end
  end
end
