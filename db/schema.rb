# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_13_093908) do

  create_table "agencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "air_mixture_inputs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "atmospheric_pressure"
    t.string "water_temperature_in"
    t.string "water_temperature_out"
    t.string "r_flow_rate"
    t.string "r_temperature"
    t.string "r_absolute_humidity"
    t.string "f_flow_rate"
    t.string "f_temperature"
    t.string "f_absolute_humidity"
    t.string "a_flow_rate"
    t.string "a_temperature"
    t.string "a_absolute_humidity"
    t.string "m_flow_rate"
    t.string "m_temperature"
    t.string "m_absolute_humidity"
    t.string "n_flow_rate"
    t.string "n_temperature"
    t.string "n_absolute_humidity"
    t.string "n_cathode_capacity"
    t.string "n_cathode_flow_rate"
    t.string "g_flow_rate"
    t.string "g_temperature"
    t.string "g_absolute_humidity"
    t.string "g_cathode_capacity"
    t.string "g_cathode_flow_rate"
    t.string "g_anode_capacity"
    t.string "p_flow_rate"
    t.string "p_temperature"
    t.string "p_absolute_humidity"
    t.string "h_flow_rate"
    t.string "h_temperature"
    t.string "h_absolute_humidity"
    t.string "j_flow_rate"
    t.string "j_temperature"
    t.string "j_absolute_humidity"
    t.string "j_cathode_capacity"
    t.string "j_cathode_flow_rate"
    t.string "c_flow_rate"
    t.string "c_temperature"
    t.string "c_absolute_humidity"
    t.string "k_flow_rate"
    t.string "k_temperature"
    t.string "k_absolute_humidity"
    t.string "l_flow_rate"
    t.string "l_temperature"
    t.string "l_absolute_humidity"
    t.string "l_cathode_capacity"
    t.string "d_flow_rate"
    t.string "d_temperature"
    t.string "d_absolute_humidity"
    t.string "e_flow_rate"
    t.string "e_temperature"
    t.string "e_absolute_humidity"
    t.string "e_anode_capacity"
    t.string "e_cathode_capacity"
    t.integer "project_id"
    t.integer "m_category_id"
    t.integer "m_unit_id"
    t.string "supply_air_sa"
    t.string "outside_air_oa"
    t.string "s_flow_rate"
    t.string "s_temperature"
    t.string "s_absolute_humidity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hot_water_in"
    t.string "hot_water_out"
    t.string "total_cooling_power"
    t.string "total_cooling_water_flow"
    t.string "total_heater_power"
    t.string "total_hot_water_flow"
    t.string "room_capacity"
    t.string "correspondes_to"
    t.string "temp_difference_SA_and_RA"
    t.string "height_above_sea_level"
    t.string "textbox2"
    t.string "textbox50"
  end

  create_table "chart_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "elapsed_time", null: false
    t.float "moisture_content", null: false
    t.bigint "room_calculation_result_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_calculation_result_id"], name: "index_chart_data_on_room_calculation_result_id"
  end

  create_table "email_histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "key_name"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_coefficients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "coefa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_correction_factors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "temperature"
    t.float "factor_k"
    t.integer "factor_correction"
    t.integer "unit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_dew_points", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "temperature"
    t.float "absolute_humidity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "key_name"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "m_units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "key_name"
    t.integer "sort"
    t.integer "m_category_id"
    t.float "p_reg"
    t.integer "dry_air"
    t.integer "wet_air"
    t.float "by_pass1"
    t.float "by_pass2"
    t.integer "rot"
    t.integer "diam"
    t.integer "hub"
    t.integer "spokes"
    t.float "area"
    t.integer "thickn"
    t.float "process"
    t.float "pu1"
    t.float "reg"
    t.float "pu2"
    t.integer "security_margin"
    t.integer "coefficient"
    t.integer "rotor"
    t.float "capacity"
    t.integer "applied_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "model_type"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "date_of_project"
    t.integer "calculation_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "room_calculation_inputs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "m_category_id"
    t.bigint "m_unit_id"
    t.integer "d_room_has_walls_towards_outdoor"
    t.integer "tightness_of_building"
    t.integer "surroundings"
    t.integer "door_to_outdoor_air"
    t.integer "number_of_people"
    t.integer "number_of_units"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "drc_relative_humidity", limit: 53
    t.float "drc_atmospheric_pressure", limit: 53
    t.float "drc_temperature", limit: 53
    t.float "odc_temperature", limit: 53
    t.float "odc_relative_humidity", limit: 53
    t.float "odc_atmospheric_pressure", limit: 53
    t.float "src_temperature", limit: 53
    t.float "src_relative_humidity", limit: 53
    t.float "src_atmospheric_pressure", limit: 53
    t.float "wind_speed", limit: 53
    t.float "without_lock_opened_per_hour", limit: 53
    t.float "air_lock_vestibule_passages_per_hour", limit: 53
    t.float "tightness_of_room", limit: 53
    t.float "door_or_air_lock_infiltration", limit: 53
    t.float "open_holes", limit: 53
    t.float "needed_airflow", limit: 53
    t.float "mechanical_ventilation", limit: 53
    t.float "total_ventilation_from_outdoor", limit: 53
    t.float "total_ventilation_from_surrounding_rooms", limit: 53
    t.float "percentage_leakage", limit: 53
    t.float "pool_length", limit: 53
    t.float "pool_width", limit: 53
    t.float "pool_surface", limit: 53
    t.float "water_temperature", limit: 53
    t.float "vaporization_coefficient", limit: 53
    t.float "total_weight_of_products", limit: 53
    t.float "start_percentage_of_moisture", limit: 53
    t.float "percentage_dried_per_hour", limit: 53
    t.float "process_airflow", limit: 53
    t.float "return_air_direct", limit: 53
    t.float "total_wet_air_flow", limit: 53
    t.float "pre_cooled_air", limit: 53
    t.float "leakage_average", limit: 53
    t.float "leakage", limit: 53
    t.float "pre_cooling_ambient_air", limit: 53
    t.float "ambient_air_direct", limit: 53
    t.float "air_direct_from_pre_cooling", limit: 53
    t.float "air_direct_from_ambient", limit: 53
    t.float "total_airflow_to_room", limit: 53
    t.float "total_dry_air_flow", limit: 53
    t.float "dry_air_temperature", limit: 53
    t.float "drc_moisture_content", limit: 53
    t.float "odc_moisture_content", limit: 53
    t.float "src_moisture_content", limit: 53
    t.float "room_length", limit: 53
    t.float "room_width", limit: 53
    t.float "room_height", limit: 53
    t.float "room_volume", limit: 53
    t.float "without_lock_door_height", limit: 53
    t.float "without_lock_door_width", limit: 53
    t.float "without_lock_door_length", limit: 53
    t.float "air_lock_doors_height", limit: 53
    t.float "air_lock_doors_width", limit: 53
    t.float "air_lock_doors_length", limit: 53
    t.float "total_load_from_ventilation", limit: 53
    t.float "moisture_load_from_each", limit: 53
    t.float "total_load_from_people", limit: 53
    t.float "total_load_from_water_surface", limit: 53
    t.float "total_load_from_product_drying", limit: 53
    t.float "total_load_from_other_sources", limit: 53
    t.float "total_moisture_load", limit: 53
    t.float "corresponding_to", limit: 53
    t.float "j_before_pre_cooler_degree", limit: 53
    t.float "j_before_pre_cooler_rate", limit: 53
    t.float "j_to_a_pre_cooling", limit: 53
    t.float "inlet_temperature", limit: 53
    t.float "inlet_moisture_content", limit: 53
    t.float "air_mix_needed_moisture_content", limit: 53
    t.float "dry_air_needed_moisture_content", limit: 53
    t.float "heat_load", limit: 53
    t.float "j_before_pre_cooler_degree_start", limit: 53
    t.float "j_before_pre_cooler_rate_start", limit: 53
    t.float "inlet_temperature_start", limit: 53
    t.float "inlet_moisture_content_start", limit: 53
    t.string "height_above_sea_level"
    t.index ["m_category_id"], name: "index_room_calculation_inputs_on_m_category_id"
    t.index ["m_unit_id"], name: "index_room_calculation_inputs_on_m_unit_id"
    t.index ["project_id"], name: "index_room_calculation_inputs_on_project_id"
  end

  create_table "room_calculation_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_calculation_input_id"
    t.bigint "project_id"
    t.string "choosen_unit"
    t.integer "number_of_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "start_temperature", limit: 53
    t.float "starting_relative_humidity", limit: 53
    t.float "starting_atmospheric_pressure", limit: 53
    t.float "final_temperature", limit: 53
    t.float "dry_air_temperature", limit: 53
    t.float "final_relative_humidity", limit: 53
    t.float "final_atmospheric_pressure", limit: 53
    t.float "starting_corresponding_to", limit: 53
    t.float "capacity_at_starting_climate", limit: 53
    t.float "final_corresponding_to", limit: 53
    t.float "capacity_at_final_climate", limit: 53
    t.float "result_xp2", limit: 53
    t.float "result_tp2", limit: 53
    t.float "result_mr", limit: 53
    t.index ["project_id"], name: "index_room_calculation_results_on_project_id"
    t.index ["room_calculation_input_id"], name: "index_room_calculation_results_on_room_calculation_input_id"
  end

  create_table "unit_selection_inputs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "m_category_id"
    t.bigint "m_unit_id"
    t.text "unit_selection_object", limit: 4294967295
    t.boolean "is_draff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["m_category_id"], name: "index_unit_selection_inputs_on_m_category_id"
    t.index ["m_unit_id"], name: "index_unit_selection_inputs_on_m_unit_id"
    t.index ["project_id"], name: "index_unit_selection_inputs_on_project_id"
  end

  create_table "unit_selection_results", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "project_id"
    t.string "rotation"
    t.string "diameter"
    t.string "depth"
    t.string "a_tp1"
    t.string "a_xp1"
    t.string "a_fp"
    t.string "a_vp"
    t.string "f_tr1"
    t.string "f_xr1"
    t.string "f_fr"
    t.string "f_vr"
    t.string "b_tp2"
    t.string "b_xp2"
    t.string "b_mr"
    t.string "d_tpu2"
    t.string "g_tr2"
    t.string "g_xr2"
    t.string "hp"
    t.string "pp"
    t.string "pr"
    t.string "ppu"
    t.string "margin"
    t.string "h"
    t.string "i"
    t.string "j"
    t.string "k"
    t.string "l"
    t.string "m"
    t.string "status"
    t.string "smo_xp2"
    t.integer "air_mixture_input_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "model_type"
    t.integer "room_calculation_input_id"
    t.boolean "is_draff"
    t.bigint "unit_selection_input_id"
    t.index ["unit_selection_input_id"], name: "index_unit_selection_results_on_unit_selection_input_id"
  end

  create_table "user_models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "m_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["m_model_id"], name: "index_user_models_on_m_model_id"
    t.index ["user_id"], name: "index_user_models_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active", default: true
    t.bigint "agency_id"
    t.integer "area", default: 0
    t.integer "role", default: 2
    t.index ["agency_id"], name: "index_users_on_agency_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
