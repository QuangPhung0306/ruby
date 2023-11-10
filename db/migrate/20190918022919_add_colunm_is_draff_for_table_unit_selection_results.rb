class AddColunmIsDraffForTableUnitSelectionResults < ActiveRecord::Migration[5.2]
  def change
  	add_column :unit_selection_results, :is_draff, :boolean
  	add_reference :unit_selection_results, :unit_selection_input
  end
end
