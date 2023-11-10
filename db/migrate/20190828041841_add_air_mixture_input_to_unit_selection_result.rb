class AddAirMixtureInputToUnitSelectionResult < ActiveRecord::Migration[5.2]
  def change
    add_column :unit_selection_results, :air_mixture_input_id, :integer
  end
end
