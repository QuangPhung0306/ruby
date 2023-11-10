module UnitSelection::Radiobutton8Checkedchanged
  def radiobutton8_checkedchanged
    if (@radiobutton8 == true)
       @textbox50_enabled = false;
       @textbox49_enabled = false;
       @textbox2_enabled = true;
       @radiobutton9 = false
       if (@flaginput == 0)
         initial_input
       end
       if (@flagini == 0)
         initial_calc
       end
    else
      @radiobutton9 = true
    end
  end
end
