module UnitSelection::Checkbox19CheckedChanged
  def checkbox19_checkedchanged
    if (@checkbox19 == true)
      @textbox10 = @textbox1.to_f.round(1).to_s
      change_textbox "textbox10", @textbox1.to_f.round(1).to_s
      @textbox19 = @textbox7.to_f.round(1).to_s
      change_textbox "textbox19", @textbox7.to_f.round(1).to_s
      @textbox10_enabled = false;
      @textbox19_enabled = false;
      @textbox47_enabled = false;
      @textbox48_enabled = false;
    else
      @textbox10_enabled = true;
      @textbox19_enabled = true;
      @textbox47_enabled = true;
      @textbox48_enabled = true;
    end
  end
end
