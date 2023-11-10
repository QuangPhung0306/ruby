module UnitSelection::Radiobutton9Checkedchanged
  def radiobutton9_checkedchanged
    if (@radiobutton9 == true)
       @textbox50_enabled = true;
       @textbox49_enabled = true;
       @textbox2_enabled = false;
       @textbox34_enabled = false;
       @radiobutton8 = false
       if (@flaginput == 0)
         initial_input
       end
       if (@flagini == 0)
         initial_calc
       end
    else
      @radiobutton8 = true
    end
  end
end
