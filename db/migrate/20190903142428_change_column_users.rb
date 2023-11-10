class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :type
    add_column :users, :role, :integer, default: 2
  end
end
