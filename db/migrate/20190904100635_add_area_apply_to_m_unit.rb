class AddAreaApplyToMUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :m_units, :applied_area, :integer
  end
end
