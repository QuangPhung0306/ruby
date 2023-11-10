class CreateMModels < ActiveRecord::Migration[5.2]
  def change
    create_table :m_models do |t|
      t.string :name
      t.string :key_name
      t.integer :sort

      t.timestamps
    end
  end
end
