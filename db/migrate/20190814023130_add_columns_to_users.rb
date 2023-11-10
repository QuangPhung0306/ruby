class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :integer
    add_column :users, :is_active, :boolean
    add_reference :users, :agency, foreign_key: true
  end
end
