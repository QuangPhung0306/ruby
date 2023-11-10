class ChangeDataTypeColumnsAirMixtureInputToString < ActiveRecord::Migration[5.2]
  def change
    change_column :air_mixture_inputs, :r_flow_rate, :string
    change_column :air_mixture_inputs, :r_temperature, :string
    change_column :air_mixture_inputs, :r_absolute_humidity, :string
    change_column :air_mixture_inputs, :f_flow_rate, :string
    change_column :air_mixture_inputs, :f_temperature, :string
    change_column :air_mixture_inputs, :f_absolute_humidity, :string
    change_column :air_mixture_inputs, :m_flow_rate, :string
    change_column :air_mixture_inputs, :m_temperature, :string
    change_column :air_mixture_inputs, :m_absolute_humidity, :string
    change_column :air_mixture_inputs, :a_flow_rate, :string
    change_column :air_mixture_inputs, :a_temperature, :string
    change_column :air_mixture_inputs, :a_absolute_humidity, :string
    change_column :air_mixture_inputs, :n_flow_rate, :string
    change_column :air_mixture_inputs, :n_temperature, :string
    change_column :air_mixture_inputs, :n_absolute_humidity, :string
    change_column :air_mixture_inputs, :n_cathode_capacity, :string
    change_column :air_mixture_inputs, :n_cathode_flow_rate, :string
    change_column :air_mixture_inputs, :g_flow_rate, :string
    change_column :air_mixture_inputs, :g_temperature, :string
    change_column :air_mixture_inputs, :g_absolute_humidity, :string
    change_column :air_mixture_inputs, :g_cathode_capacity, :string
    change_column :air_mixture_inputs, :g_cathode_flow_rate, :string
    change_column :air_mixture_inputs, :g_anode_capacity, :string
    change_column :air_mixture_inputs, :h_flow_rate, :string
    change_column :air_mixture_inputs, :h_temperature, :string
    change_column :air_mixture_inputs, :h_absolute_humidity, :string
    change_column :air_mixture_inputs, :p_flow_rate, :string
    change_column :air_mixture_inputs, :p_temperature, :string
    change_column :air_mixture_inputs, :p_absolute_humidity, :string
    change_column :air_mixture_inputs, :j_flow_rate, :string
    change_column :air_mixture_inputs, :j_temperature, :string
    change_column :air_mixture_inputs, :j_absolute_humidity, :string
    change_column :air_mixture_inputs, :j_cathode_capacity, :string
    change_column :air_mixture_inputs, :j_cathode_flow_rate, :string
    change_column :air_mixture_inputs, :c_flow_rate, :string
    change_column :air_mixture_inputs, :c_temperature, :string
    change_column :air_mixture_inputs, :c_absolute_humidity, :string
    change_column :air_mixture_inputs, :k_flow_rate, :string
    change_column :air_mixture_inputs, :k_temperature, :string
    change_column :air_mixture_inputs, :k_absolute_humidity, :string
    change_column :air_mixture_inputs, :l_flow_rate, :string
    change_column :air_mixture_inputs, :l_temperature, :string
    change_column :air_mixture_inputs, :l_absolute_humidity, :string
    change_column :air_mixture_inputs, :l_cathode_capacity, :string
    change_column :air_mixture_inputs, :d_flow_rate, :string
    change_column :air_mixture_inputs, :d_temperature, :string
    change_column :air_mixture_inputs, :d_absolute_humidity, :string
    change_column :air_mixture_inputs, :e_flow_rate, :string
    change_column :air_mixture_inputs, :e_temperature, :string
    change_column :air_mixture_inputs, :e_absolute_humidity, :string
    change_column :air_mixture_inputs, :e_anode_capacity, :string
    change_column :air_mixture_inputs, :e_cathode_capacity, :string
    change_column :air_mixture_inputs, :s_flow_rate, :string
    change_column :air_mixture_inputs, :s_temperature, :string
    change_column :air_mixture_inputs, :s_absolute_humidity, :string
    change_column :air_mixture_inputs, :supply_air_sa, :string  	
    change_column :air_mixture_inputs, :outside_air_oa, :string
    change_column :air_mixture_inputs, :atmospheric_pressure, :string
    change_column :air_mixture_inputs, :water_temperature_in, :string
    change_column :air_mixture_inputs, :water_temperature_out, :string
  end
end