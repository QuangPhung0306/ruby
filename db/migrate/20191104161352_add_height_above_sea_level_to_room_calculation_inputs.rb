class AddHeightAboveSeaLevelToRoomCalculationInputs < ActiveRecord::Migration[5.2]
  def change
    add_column :room_calculation_inputs, :height_above_sea_level, :string
  end
end
