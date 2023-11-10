class CreateMCoefficients < ActiveRecord::Migration[5.2]
  def change
    create_table :m_coefficients do |t|
      t.string :name
      t.text :coefa
      t.timestamps
    end
  end
end
