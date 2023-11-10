class AddColumnsToAirMixtureInputs < ActiveRecord::Migration[5.2]
  def change
    add_column :air_mixture_inputs, :supply_air_sa, :integer
    add_column :air_mixture_inputs, :outside_air_oa, :float
    add_column :air_mixture_inputs, :s_flow_rate, :integer
    add_column :air_mixture_inputs, :s_temperature, :float
    add_column :air_mixture_inputs, :s_absolute_humidity, :float
  end
end
