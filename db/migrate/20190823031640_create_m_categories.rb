class CreateMCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :m_categories do |t|
      t.string :name
      t.string :key_name
      t.integer :sort
    end
  end
end
