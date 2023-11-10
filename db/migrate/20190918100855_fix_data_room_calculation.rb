class FixDataRoomCalculation < ActiveRecord::Migration[5.2]
  def change
    remove_column :room_calculation_inputs, :drc_relative_humidity
    remove_column :room_calculation_inputs, :drc_atmospheric_pressure
    remove_column :room_calculation_inputs, :drc_temperature
    remove_column :room_calculation_inputs, :odc_temperature
    remove_column :room_calculation_inputs, :odc_relative_humidity
    remove_column :room_calculation_inputs, :odc_atmospheric_pressure
    remove_column :room_calculation_inputs, :src_temperature
    remove_column :room_calculation_inputs, :src_relative_humidity
    remove_column :room_calculation_inputs, :src_atmospheric_pressure
    remove_column :room_calculation_inputs, :wind_speed
    remove_column :room_calculation_inputs, :without_lock_opened_per_hour
    remove_column :room_calculation_inputs, :air_lock_vestibule_passages_per_hour
    remove_column :room_calculation_inputs, :tightness_of_room
    remove_column :room_calculation_inputs, :door_or_air_lock_infiltration
    remove_column :room_calculation_inputs, :open_holes
    remove_column :room_calculation_inputs, :needed_airflow
    remove_column :room_calculation_inputs, :mechanical_ventilation
    remove_column :room_calculation_inputs, :total_ventilation_from_outdoor
    remove_column :room_calculation_inputs, :total_ventilation_from_surrounding_rooms
    remove_column :room_calculation_inputs, :percentage_leakage
    remove_column :room_calculation_inputs, :pool_length
    remove_column :room_calculation_inputs, :pool_width
    remove_column :room_calculation_inputs, :pool_surface
    remove_column :room_calculation_inputs, :water_temperature
    remove_column :room_calculation_inputs, :vaporization_coefficient
    remove_column :room_calculation_inputs, :total_weight_of_products
    remove_column :room_calculation_inputs, :start_percentage_of_moisture
    remove_column :room_calculation_inputs, :percentage_dried_per_hour
    remove_column :room_calculation_inputs, :process_airflow
    remove_column :room_calculation_inputs, :return_air_direct
    remove_column :room_calculation_inputs, :total_wet_air_flow
    remove_column :room_calculation_inputs, :pre_cooled_air
    remove_column :room_calculation_inputs, :leakage_average
    remove_column :room_calculation_inputs, :leakage
    remove_column :room_calculation_inputs, :pre_cooling_ambient_air
    remove_column :room_calculation_inputs, :ambient_air_direct
    remove_column :room_calculation_inputs, :air_direct_from_pre_cooling
    remove_column :room_calculation_inputs, :air_direct_from_ambient
    remove_column :room_calculation_inputs, :total_airflow_to_room
    remove_column :room_calculation_inputs, :total_dry_air_flow
    remove_column :room_calculation_inputs, :dry_air_temperature
    remove_column :room_calculation_inputs, :drc_moisture_content
    remove_column :room_calculation_inputs, :odc_moisture_content
    remove_column :room_calculation_inputs, :src_moisture_content
    remove_column :room_calculation_inputs, :room_length
    remove_column :room_calculation_inputs, :room_width
    remove_column :room_calculation_inputs, :room_height
    remove_column :room_calculation_inputs, :room_volume
    remove_column :room_calculation_inputs, :without_lock_door_height
    remove_column :room_calculation_inputs, :without_lock_door_width
    remove_column :room_calculation_inputs, :without_lock_door_length
    remove_column :room_calculation_inputs, :air_lock_doors_height
    remove_column :room_calculation_inputs, :air_lock_doors_width
    remove_column :room_calculation_inputs, :air_lock_doors_length
    remove_column :room_calculation_inputs, :total_load_from_ventilation
    remove_column :room_calculation_inputs, :moisture_load_from_each
    remove_column :room_calculation_inputs, :total_load_from_people
    remove_column :room_calculation_inputs, :total_load_from_water_surface
    remove_column :room_calculation_inputs, :total_load_from_product_drying
    remove_column :room_calculation_inputs, :total_load_from_other_sources
    remove_column :room_calculation_inputs, :total_moisture_load
    remove_column :room_calculation_inputs, :corresponding_to
    remove_column :room_calculation_inputs, :j_before_pre_cooler_degree
    remove_column :room_calculation_inputs, :j_before_pre_cooler_rate
    remove_column :room_calculation_inputs, :j_to_a_pre_cooling
    remove_column :room_calculation_inputs, :inlet_temperature
    remove_column :room_calculation_inputs, :inlet_moisture_content
    remove_column :room_calculation_inputs, :air_mix_needed_moisture_content
    remove_column :room_calculation_inputs, :dry_air_needed_moisture_content
    remove_column :room_calculation_inputs, :heat_load

    remove_column :room_calculation_results, :start_temperature
    remove_column :room_calculation_results, :starting_relative_humidity
    remove_column :room_calculation_results, :starting_atmospheric_pressure
    remove_column :room_calculation_results, :final_temperature
    remove_column :room_calculation_results, :final_relative_humidity
    remove_column :room_calculation_results, :final_atmospheric_pressure
    remove_column :room_calculation_results, :starting_corresponding_to
    remove_column :room_calculation_results, :capacity_at_starting_climate
    remove_column :room_calculation_results, :final_corresponding_to
    remove_column :room_calculation_results, :capacity_at_final_climate


    add_column :room_calculation_inputs, :drc_relative_humidity, :double
    add_column :room_calculation_inputs, :drc_atmospheric_pressure, :double
    add_column :room_calculation_inputs, :drc_temperature, :double
    add_column :room_calculation_inputs, :odc_temperature, :double
    add_column :room_calculation_inputs, :odc_relative_humidity, :double
    add_column :room_calculation_inputs, :odc_atmospheric_pressure, :double
    add_column :room_calculation_inputs, :src_temperature, :double
    add_column :room_calculation_inputs, :src_relative_humidity, :double
    add_column :room_calculation_inputs, :src_atmospheric_pressure, :double
    add_column :room_calculation_inputs, :wind_speed, :double
    add_column :room_calculation_inputs, :without_lock_opened_per_hour, :double
    add_column :room_calculation_inputs, :air_lock_vestibule_passages_per_hour, :double
    add_column :room_calculation_inputs, :tightness_of_room, :double
    add_column :room_calculation_inputs, :door_or_air_lock_infiltration, :double
    add_column :room_calculation_inputs, :open_holes, :double
    add_column :room_calculation_inputs, :needed_airflow, :double
    add_column :room_calculation_inputs, :mechanical_ventilation, :double
    add_column :room_calculation_inputs, :total_ventilation_from_outdoor, :double
    add_column :room_calculation_inputs, :total_ventilation_from_surrounding_rooms, :double
    add_column :room_calculation_inputs, :percentage_leakage, :double
    add_column :room_calculation_inputs, :pool_length, :double
    add_column :room_calculation_inputs, :pool_width, :double
    add_column :room_calculation_inputs, :pool_surface, :double
    add_column :room_calculation_inputs, :water_temperature, :double
    add_column :room_calculation_inputs, :vaporization_coefficient, :double
    add_column :room_calculation_inputs, :total_weight_of_products, :double
    add_column :room_calculation_inputs, :start_percentage_of_moisture, :double
    add_column :room_calculation_inputs, :percentage_dried_per_hour, :double
    add_column :room_calculation_inputs, :process_airflow, :double
    add_column :room_calculation_inputs, :return_air_direct, :double
    add_column :room_calculation_inputs, :total_wet_air_flow, :double
    add_column :room_calculation_inputs, :pre_cooled_air, :double
    add_column :room_calculation_inputs, :leakage_average, :double
    add_column :room_calculation_inputs, :leakage, :double
    add_column :room_calculation_inputs, :pre_cooling_ambient_air, :double
    add_column :room_calculation_inputs, :ambient_air_direct, :double
    add_column :room_calculation_inputs, :air_direct_from_pre_cooling, :double
    add_column :room_calculation_inputs, :air_direct_from_ambient, :double
    add_column :room_calculation_inputs, :total_airflow_to_room, :double
    add_column :room_calculation_inputs, :total_dry_air_flow, :double
    add_column :room_calculation_inputs, :dry_air_temperature, :double
    add_column :room_calculation_inputs, :drc_moisture_content, :double
    add_column :room_calculation_inputs, :odc_moisture_content, :double
    add_column :room_calculation_inputs, :src_moisture_content, :double
    add_column :room_calculation_inputs, :room_length, :double
    add_column :room_calculation_inputs, :room_width, :double
    add_column :room_calculation_inputs, :room_height, :double
    add_column :room_calculation_inputs, :room_volume, :double
    add_column :room_calculation_inputs, :without_lock_door_height, :double
    add_column :room_calculation_inputs, :without_lock_door_width, :double
    add_column :room_calculation_inputs, :without_lock_door_length, :double
    add_column :room_calculation_inputs, :air_lock_doors_height, :double
    add_column :room_calculation_inputs, :air_lock_doors_width, :double
    add_column :room_calculation_inputs, :air_lock_doors_length, :double
    add_column :room_calculation_inputs, :total_load_from_ventilation, :double
    add_column :room_calculation_inputs, :moisture_load_from_each, :double
    add_column :room_calculation_inputs, :total_load_from_people, :double
    add_column :room_calculation_inputs, :total_load_from_water_surface, :double
    add_column :room_calculation_inputs, :total_load_from_product_drying, :double
    add_column :room_calculation_inputs, :total_load_from_other_sources, :double
    add_column :room_calculation_inputs, :total_moisture_load, :double
    add_column :room_calculation_inputs, :corresponding_to, :double
    add_column :room_calculation_inputs, :j_before_pre_cooler_degree, :double
    add_column :room_calculation_inputs, :j_before_pre_cooler_rate, :double
    add_column :room_calculation_inputs, :j_to_a_pre_cooling, :double
    add_column :room_calculation_inputs, :inlet_temperature, :double
    add_column :room_calculation_inputs, :inlet_moisture_content, :double
    add_column :room_calculation_inputs, :air_mix_needed_moisture_content, :double
    add_column :room_calculation_inputs, :dry_air_needed_moisture_content, :double
    add_column :room_calculation_inputs, :heat_load, :double

    add_column :room_calculation_results, :start_temperature, :double
    add_column :room_calculation_results, :starting_relative_humidity, :double
    add_column :room_calculation_results, :starting_atmospheric_pressure, :double
    add_column :room_calculation_results, :final_temperature, :double
    add_column :room_calculation_results, :dry_air_temperature, :double
    add_column :room_calculation_results, :final_relative_humidity, :double
    add_column :room_calculation_results, :final_atmospheric_pressure, :double
    add_column :room_calculation_results, :starting_corresponding_to, :double
    add_column :room_calculation_results, :capacity_at_starting_climate, :double
    add_column :room_calculation_results, :final_corresponding_to, :double
    add_column :room_calculation_results, :capacity_at_final_climate, :double

  end
end
