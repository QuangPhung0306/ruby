class CreateRoomCalculationResults < ActiveRecord::Migration[5.2]
  def change
    create_table :room_calculation_results do |t|
      t.references :room_calculation_input, foreign_key: true
      t.references :project, foreign_key: true
      t.string :choosen_unit
      t.integer :number_of_unit
      t.integer :start_temperature
      t.integer :starting_relative_humidity
      t.integer :starting_atmospheric_pressure
      t.float :starting_corresponding_to
      t.float :capacity_at_starting_climate
      t.integer :final_temperature
      t.integer :final_relative_humidity
      t.integer :final_atmospheric_pressure
      t.float :final_corresponding_to
      t.float :capacity_at_final_climate

      t.timestamps
    end
  end
end
