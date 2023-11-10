class AddModelIdToMUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :m_units, :model_type, :integer
  end
end
