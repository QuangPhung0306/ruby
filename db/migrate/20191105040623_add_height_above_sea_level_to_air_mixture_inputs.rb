class AddHeightAboveSeaLevelToAirMixtureInputs < ActiveRecord::Migration[5.2]
  def change
    add_column :air_mixture_inputs, :height_above_sea_level, :string
  end
end
