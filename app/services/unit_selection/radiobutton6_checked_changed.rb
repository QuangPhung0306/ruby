module UnitSelection::Radiobutton6CheckedChanged
  def radiobutton6_checkedchanged
    @flaginput = 1
    if (@radiobutton6 == true)
      if @input_ids.present?
        @unit_selection_inputs = ::UnitSelectionInput.where(id: @input_ids)
        @result_ids = @unit_selection_inputs.map{|input| input.unit_selection_result.id}
        @unit_selection_objects = @unit_selection_inputs.pluck :unit_selection_object
        @present_datavalue = @unit_selection_objects.map{|unit_selection_object| unit_selection_object.instance_variable_get(:@datavalue).first}
        @present_datavalue.to_a.each_with_index do |element, k|
          next if @unit_selection_objects[k].instance_variable_get(:@radiobutton6)
          @present_datavalue[k][3] = @present_datavalue[k][3].to_f * 1.8 + 32
          @present_datavalue[k][4] = @present_datavalue[k][4].to_f * 7
          @present_datavalue[k][5] = (@present_datavalue[k][5].to_f / 1.699)
          @present_datavalue[k][6] = @present_datavalue[k][6].to_f * 1.8 + 32
          @present_datavalue[k][7] = @present_datavalue[k][7].to_f * 7
          @present_datavalue[k][8] = (@present_datavalue[k][8].to_f / 1.699)
          @present_datavalue[k][9] = @present_datavalue[k][9].to_f * 1.8 + 32
          @present_datavalue[k][10] = @present_datavalue[k][10].to_f * 7
          @present_datavalue[k][11] = @present_datavalue[k][11].to_f * 1.8 + 32
          @present_datavalue[k][12] = @present_datavalue[k][12].to_f * 1.8 + 32
          @present_datavalue[k][13] = @present_datavalue[k][13].to_f * 7
          @present_datavalue[k][14] = @present_datavalue[k][14].to_f * 1000 / 0.29307107
          @present_datavalue[k][15] = 0.004015*@present_datavalue[k][15].to_f
          @present_datavalue[k][16] = 0.004015*@present_datavalue[k][16].to_f
          @present_datavalue[k][17] = 0.004015*@present_datavalue[k][17].to_f
           @present_datavalue[k][18] = @present_datavalue[k][18].to_f / 0.00508
          @present_datavalue[k][19] = @present_datavalue[k][19].to_f / 0.00508
          @present_datavalue[k][20] = @present_datavalue[k][20].to_f * 2.204623

          @present_datavalue[k][28] = @present_datavalue[k][28].to_f * 7
          @present_datavalue[k][29] = @present_datavalue[k][29].to_f * 7
          @present_datavalue[k][30] = @present_datavalue[k][30].to_f * 1.8 + 32
          @present_datavalue[k][31] = @present_datavalue[k][31].to_f * 7
          @present_datavalue[k][32] = @present_datavalue[k][32].to_f * 1.8 + 32
          @present_datavalue[k][33] = @present_datavalue[k][33].to_f * 7
          @present_datavalue[k][34] = @present_datavalue[k][34].to_f * 1.8 + 32
          @present_datavalue[k][35] = @present_datavalue[k][35].to_f * 7
          @present_datavalue[k][36] = @present_datavalue[k][36].to_f * 1.8 + 32
          @present_datavalue[k][37] = @present_datavalue[k][37].to_f * 7

          @present_datavalue[k][38] = @present_datavalue[k][38].to_f * 1.8 + 32
          @present_datavalue[k][39] = @present_datavalue[k][39].to_f * 7
          @present_datavalue[k][40] = @present_datavalue[k][40].to_f * 1.8 + 32
          @present_datavalue[k][41] = @present_datavalue[k][41].to_f * 7
          @present_datavalue[k][42] = @present_datavalue[k][42].to_f / 1.699

          @present_datavalue[k][45] = @present_datavalue[k][45].to_f * 1.8 + 32
          @present_datavalue[k][46] = @present_datavalue[k][46].to_f * 7
          @present_datavalue[k][47] = @present_datavalue[k][47].to_f * 1.8 + 32
          @present_datavalue[k][48] = @present_datavalue[k][48].to_f * 7
          @present_datavalue[k][53] = @present_datavalue[k][53].to_f / 0.00508
          @present_datavalue[k][54] = @present_datavalue[k][54].to_f / 0.00508
          @present_datavalue[k][64] = @present_datavalue[k][64].to_f / 1.699
          @present_datavalue[k][65] = @present_datavalue[k][65].to_f / 1.699
          @present_datavalue[k][66] = @present_datavalue[k][66].to_f / 1.699
          @present_datavalue[k][67] = @present_datavalue[k][67].to_f / 1.699
        end
      end
      initial_input

      initial_calc
    end
  end
end
