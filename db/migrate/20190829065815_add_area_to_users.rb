class AddAreaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :area, :integer, default: 0
    change_column :users, :is_active, :boolean, default: true
  end
end
