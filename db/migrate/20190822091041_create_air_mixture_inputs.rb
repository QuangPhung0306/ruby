class CreateAirMixtureInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :air_mixture_inputs do |t|
      t.integer :atmospheric_pressure
      t.integer :water_temperature_in
      t.integer :water_temperature_out
      t.integer :fix_regulated_air_in
      t.integer :r_flow_rate
      t.integer :r_temperature
      t.float :r_absolute_humidity
      t.integer :f_flow_rate
      t.integer :f_temperature
      t.integer :f_absolute_humidity
      t.integer :a_flow_rate
      t.integer :a_temperature
      t.float :a_absolute_humidity
      t.integer :m_flow_rate
      t.integer :m_temperature
      t.integer :m_absolute_humidity
      t.integer :n_flow_rate
      t.integer :n_temperature
      t.float :n_absolute_humidity
      t.float :n_cathode_capacity
      t.float :n_cathode_flow_rate
      t.integer :g_flow_rate
      t.float :g_temperature
      t.float :g_absolute_humidity
      t.float :g_cathode_capacity
      t.float :g_cathode_flow_rate
      t.float :g_anode_capacity
      t.integer :p_flow_rate
      t.float :p_temperature
      t.float :p_absolute_humidity
      t.integer :h_flow_rate
      t.float :h_temperature
      t.float :h_absolute_humidity
      t.integer :j_flow_rate
      t.float :j_temperature
      t.float :j_absolute_humidity
      t.float :j_cathode_capacity
      t.float :j_cathode_flow_rate
      t.integer :c_flow_rate
      t.float :c_temperature
      t.float :c_absolute_humidity
      t.integer :k_flow_rate
      t.float :k_temperature
      t.float :k_absolute_humidity
      t.integer :l_flow_rate
      t.float :l_temperature
      t.float :l_absolute_humidity
      t.float :l_cathode_capacity
      t.integer :d_flow_rate
      t.float :d_temperature
      t.float :d_absolute_humidity
      t.integer :e_flow_rate
      t.float :e_temperature
      t.float :e_absolute_humidity
      t.float :e_anode_capacity
      t.float :e_cathode_capacity
      t.integer :project_id
      t.integer :m_category_id
      t.integer :m_unit_id
    end
  end
end