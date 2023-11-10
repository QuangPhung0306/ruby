module UnitSelection::Radiobutton5CheckedChanged
  def radiobutton5_checkedchanged
    @flagini = 1

    if (@radiobutton5 == true)
      @checkbox12 = false
      if (@checkbox19 == true)
        @textbox10_enabled = false
        @textbox19_enabled = false
      else
        @textbox10_enabled = true
        @textbox19_enabled = true
      end
      @textbox48_enabled = false
      @textbox47_enabled = false
      if @input_ids.present?
        @unit_selection_inputs = ::UnitSelectionInput.where(id: @input_ids)
        @result_ids = @unit_selection_inputs.map{|input| input.unit_selection_result.id}
        @unit_selection_objects = @unit_selection_inputs.pluck :unit_selection_object
        @present_datavalue = @unit_selection_objects.map{|unit_selection_object| unit_selection_object.instance_variable_get(:@datavalue).first}
        @present_datavalue.to_a.each_with_index do |element, k|
          next if @unit_selection_objects[k].instance_variable_get(:@radiobutton5)

          @present_datavalue[k][3] = (@present_datavalue[k][3] - 32) / 1.8
          @present_datavalue[k][4] = @present_datavalue[k][4] / 7
          @present_datavalue[k][5] = @present_datavalue[k][5] * 1.699
          @present_datavalue[k][6] = (@present_datavalue[k][6] - 32) / 1.8
          @present_datavalue[k][7] = @present_datavalue[k][7] / 7
          @present_datavalue[k][8] = @present_datavalue[k][8] * 1.699
          @present_datavalue[k][9] = (@present_datavalue[k][9] - 32) / 1.8
          @present_datavalue[k][10] = @present_datavalue[k][10] / 7
          @present_datavalue[k][11] = (@present_datavalue[k][11] - 32) / 1.8
          @present_datavalue[k][12] = (@present_datavalue[k][12] - 32) / 1.8
          @present_datavalue[k][13] = @present_datavalue[k][13] / 7
          @present_datavalue[k][14] = @present_datavalue[k][14] / 1000 * 0.29307107
          @present_datavalue[k][15] = @present_datavalue[k][15] / 0.004015
          @present_datavalue[k][16] = @present_datavalue[k][16] / 0.004015
          @present_datavalue[k][17] = @present_datavalue[k][17] / 0.004015
          @present_datavalue[k][18] = @present_datavalue[k][18] * 0.00508
          @present_datavalue[k][19] = @present_datavalue[k][19] * 0.00508
          @present_datavalue[k][20] = @present_datavalue[k][20] / 2.204623

          @present_datavalue[k][28] = @present_datavalue[k][28] / 7
          @present_datavalue[k][29] = @present_datavalue[k][29] / 7
          @present_datavalue[k][30] = (@present_datavalue[k][30] - 32) / 1.8
          @present_datavalue[k][31] = @present_datavalue[k][31] / 7
          @present_datavalue[k][32] = (@present_datavalue[k][32] - 32) / 1.8
          @present_datavalue[k][33] = @present_datavalue[k][33] / 7
          @present_datavalue[k][34] = (@present_datavalue[k][34] - 32) / 1.82
          @present_datavalue[k][35] = @present_datavalue[k][35] / 7
          @present_datavalue[k][36] = (@present_datavalue[k][36] - 32) / 1.8
          @present_datavalue[k][37] = @present_datavalue[k][37] / 7
          @present_datavalue[k][38] = (@present_datavalue[k][38] - 32) / 1.8
          @present_datavalue[k][39] = @present_datavalue[k][39] / 7
          @present_datavalue[k][40] = (@present_datavalue[k][40] - 32) / 1.8
          @present_datavalue[k][41] = @present_datavalue[k][41] / 7
          @present_datavalue[k][42] = @present_datavalue[k][42] * 1.699
          @present_datavalue[k][45] = (@present_datavalue[k][45] - 32) / 1.8
          @present_datavalue[k][46] = @present_datavalue[k][46] / 7
          @present_datavalue[k][47] = (@present_datavalue[k][47] - 32) / 1.8
          @present_datavalue[k][48] = @present_datavalue[k][48] / 7
          @present_datavalue[k][53] = @present_datavalue[k][53] * 0.00508
          @present_datavalue[k][54] = @present_datavalue[k][54] * 0.00508
          @present_datavalue[k][64] = @present_datavalue[k][64] * 1.699
          @present_datavalue[k][65] = @present_datavalue[k][65] * 1.699
          @present_datavalue[k][66] = @present_datavalue[k][66] * 1.699
          @present_datavalue[k][67] = @present_datavalue[k][67] * 1.699
        end
      end

      @textbox27_enabled = false
      @textbox26_enabled = false
      @textbox28_enabled = false
      @textbox31_enabled = false
      @textbox30_enabled = false
      @textbox29_enabled = false
      @textbox34_enabled = false
      @textbox33_enabled = false
      @textbox32_enabled = false

      @textbox4_enabled = true
      @textbox6_enabled = true
      @textbox22_enabled = true
      @textbox1_enabled = true
      @textbox7_enabled = true
      @textbox23_enabled = true
      @textbox2_enabled = true
      @textbox5_enabled = true

      if (@checkbox1 == true)
        @textbox33_enabled = false
        @textbox5_enabled = false
      else
        @textbox33_enabled = true
        @textbox5_enabled = true
      end
     
      @textbox38_enabled = false
      @textbox32_enabled = false

      initial_input

      initial_calc
    end
  end
end
