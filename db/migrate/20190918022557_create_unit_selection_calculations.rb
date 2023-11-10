class CreateUnitSelectionCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_selection_calculations do |t|

    	t.longtext :unit_selection_object
      t.timestamps
    end
  end
end
