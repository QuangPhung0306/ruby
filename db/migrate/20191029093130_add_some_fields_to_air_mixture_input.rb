class AddSomeFieldsToAirMixtureInput < ActiveRecord::Migration[5.2]
  def change
    add_column :air_mixture_inputs, :hot_water_in, :string
    add_column :air_mixture_inputs, :hot_water_out, :string
    add_column :air_mixture_inputs, :total_cooling_power, :string
    add_column :air_mixture_inputs, :total_cooling_water_flow, :string
    add_column :air_mixture_inputs, :total_heater_power, :string
    add_column :air_mixture_inputs, :total_hot_water_flow, :string
    add_column :air_mixture_inputs, :room_capacity, :string
    add_column :air_mixture_inputs, :correspondes_to, :string
    add_column :air_mixture_inputs, :temp_difference_SA_and_RA, :string
  end
end
