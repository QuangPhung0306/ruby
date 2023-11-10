class AddSomeColumnsToUnitSelectionResults < ActiveRecord::Migration[5.2]
  def change
    add_column :unit_selection_results, :model_type, :integer
    rename_column :unit_selection_results, :pa, :pr
    add_column :unit_selection_results, :room_calculation_input_id, :integer
  end
end
