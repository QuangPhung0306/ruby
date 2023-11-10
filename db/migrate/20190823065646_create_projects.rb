class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :date_of_project
      t.integer :calculation_type
      t.references :user, foreign_key: true
    end
  end
end
