class AddInputStartToR003 < ActiveRecord::Migration[5.2]
  def change
    add_column :room_calculation_inputs, :j_before_pre_cooler_degree_start, :double
    add_column :room_calculation_inputs, :j_before_pre_cooler_rate_start, :double
    add_column :room_calculation_inputs, :inlet_temperature_start, :double
    add_column :room_calculation_inputs, :inlet_moisture_content_start, :double
  end
end
