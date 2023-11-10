module UnitSelection::Combobox4SelectedIndexChanged
  def combobox4_selected_index_changed
    if (@checkbox18 == true)
      optimal_rotation
    end

    if (@combobox4 == "50")
      @checkbox14 = false
      @checkbox15 = false
      @checkbox16 = false
      @checkbox17 = true
    elsif (@combobox4 == "100")
      @checkbox14 = true
      @checkbox15 = false
      @checkbox16 = false
      @checkbox17 = false
    elsif (@combobox4 == "200")
      @checkbox14 = false
      @checkbox15 = true
      @checkbox16 = false
      @checkbox17 = false
    elsif (@combobox4 == "400")
      @checkbox14 = false
      @checkbox15 = false
      @checkbox16 = true
      @checkbox17 = false
    else
      @checkbox14 = false
      @checkbox15 = false
      @checkbox16 = false
      @checkbox17 = false
    end
  end
end
