class ChangeTotalLoadRoomCalculationInput < ActiveRecord::Migration[5.2]
  def change
    remove_column :room_calculation_inputs, :heat_lead
    add_column :room_calculation_inputs, :heat_load, :float
  end
end
