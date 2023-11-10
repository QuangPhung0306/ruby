class CreateRoomCalculationInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :room_calculation_inputs do |t|
      t.references :project, foreign_key: true
      t.references :m_category, foreign_key: true
      t.references :m_unit, foreign_key: true
      t.integer :drc_temperature
      t.integer :drc_relative_humidity
      t.integer :drc_atmospheric_pressure
      t.float :drc_moisture_content
      t.integer :d_room_has_walls_towards_outdoor
      t.integer :odc_temperature
      t.integer :odc_relative_humidity
      t.integer :odc_atmospheric_pressure
      t.float :odc_moisture_content
      t.integer :src_temperature
      t.integer :src_relative_humidity
      t.integer :src_atmospheric_pressure
      t.float :src_moisture_content
      t.float :room_length
      t.float :room_width
      t.float :room_height
      t.float :room_volume
      t.integer :tightness_of_building
      t.integer :surroundings
      t.float :without_lock_door_height
      t.float :without_lock_door_width
      t.float :without_lock_door_length
      t.float :air_lock_doors_height
      t.float :air_lock_doors_width
      t.float :air_lock_doors_length
      t.integer :door_to_outdoor_air
      t.integer :wind_speed
      t.integer :without_lock_opened_per_hour
      t.integer :air_lock_vestibule_passages_per_hour
      t.integer :tightness_of_room
      t.integer :door_or_air_lock_infiltration
      t.integer :open_holes
      t.integer :needed_airflow
      t.integer :mechanical_ventilation
      t.integer :total_ventilation_from_outdoor
      t.integer :total_ventilation_from_surrounding_rooms
      t.integer :percentage_leakage
      t.float :total_load_from_ventilation
      t.integer :number_of_people
      t.float :moisture_load_from_each
      t.float :total_load_from_people
      t.integer :pool_length
      t.integer :pool_width
      t.integer :pool_surface
      t.integer :water_temperature
      t.integer :vaporization_coefficient
      t.float :total_load_from_water_surface
      t.integer :total_weight_of_products
      t.integer :start_percentage_of_moisture
      t.integer :percentage_dried_per_hour
      t.float :total_load_from_product_drying
      t.float :total_load_from_other_sources
      t.float :total_moisture_load
      t.integer :number_of_units
      t.integer :process_airflow
      t.integer :return_air_direct
      t.integer :total_wet_air_flow
      t.integer :pre_cooled_air
      t.integer :leakage_average
      t.integer :leakage
      t.integer :pre_cooling_ambient_air
      t.float :corresponding_to
      t.integer :ambient_air_direct
      t.integer :air_direct_from_pre_cooling
      t.float :j_before_pre_cooler_degree
      t.float :j_before_pre_cooler_rate
      t.float :j_to_a_pre_cooling
      t.float :inlet_temperature
      t.float :inlet_moisture_content
      t.integer :air_direct_from_ambient
      t.integer :total_airflow_to_room
      t.float :air_mix_needed_moisture_content
      t.integer :total_dry_air_flow
      t.float :dry_air_needed_moisture_content
      t.integer :dry_air_temperature
      t.float :heat_lead

      t.timestamps
    end
  end
end
