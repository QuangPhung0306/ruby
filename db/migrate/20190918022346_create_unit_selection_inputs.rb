class CreateUnitSelectionInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_selection_inputs do |t|
    	t.references :project
    	t.references :m_category
    	t.references :m_unit
    	t.longtext :unit_selection_object
    	t.boolean :is_draff
      t.timestamps
    end
  end
end
