class DropTableUnitSelectionCalculation < ActiveRecord::Migration[5.2]
  def change
    drop_table :unit_selection_calculations
  end
end
