class CreateMDewPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :m_dew_points do |t|
      t.integer :temperature
      t.float :absolute_humidity
    end
  end
end
