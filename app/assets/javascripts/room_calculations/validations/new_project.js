function new_room_calculation_project_si(){
  $.validator.addMethod('decimal', function(value, element) {
    return this.optional(element) || /(^[-+]?([0-9]+)+[,.]?([0-9]+)?)$/.test(value);
  }, "Please enter a correct number or decimal");

  $.validator.addMethod('max_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") <= param;
  });

  $.validator.addMethod('min_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") >= param;
  });

  $('.new-room-calculation-project').validate({
    ignore: ":disabled",
    rules:{
      'm_unit_id':{
        required: true
      },
      'project_name': {
        required: true,
        maxlength: 50
      },
      'date_of_project': {
        required: true,
      },
      'm_category_id': {
        required: true,
      },
      'number_of_units': {
        digits: true,
        min_custom: 1
      },
      "drc_temperature":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      "drc_relative_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 180
      },
      "drc_height_above_sea_level":{
        required: true,
        decimal: true,
        min_custom: -400,
        max_custom: 9000
      },
      "odc_height_above_sea_level":{
        required: true,
        decimal: true,
        min_custom: -400,
        max_custom: 9000
      },
      "src_height_above_sea_level":{
        required: true,
        decimal: true,
        min_custom: -400,
        max_custom: 9000
      },
      "d_room_has_walls_towards_outdoor":{
        required: true,
        decimal: true
      },
      "odc_temperature":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      "odc_relative_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "src_temperature":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      "src_relative_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "room_length":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "room_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "room_height":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "tightness_of_building":{
        required: true,
        decimal: true,
        min_custom: 1,
        max_custom: 7
      },
      "surroundings":{
        required: true,
        decimal: true,
        min_custom: 1,
        max_custom: 4
      },
      "without_lock_door_height":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "without_lock_door_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_doors_height":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_doors_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_doors_length":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "door_to_outdoor_air":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "wind_speed":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "without_lock_opened_per_hour":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_vestibule_passages_per_hour":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "open_holes":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "mechanical_ventilation":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "number_of_people":{
        required: true,
        digits: true,
        min_custom: 0
      },
      "moisture_load_from_each":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "pool_length":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "pool_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "water_temperature":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "vaporization_coefficient":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "total_weight_of_products":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "start_percentage_of_moisture":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "percentage_dried_per_hour":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "total_load_from_other_sources":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "total_wet_air_flow":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "dry_air_temperature":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      "process_airflow":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "return_air_direct":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "j_to_a_pre_cooling":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      "pre_cooled_air":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "pre_cooling_ambient_air":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      "air_direct_from_pre_cooling":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_direct_from_ambient":{
        required: true,
        decimal: true,
        min_custom: 0
      }
    },
    messages:{
      'm_unit_id': {
        required: I18n.t('js.room_calculation.m_unit_id_required')
      },
      'project_name': {
        required: I18n.t('js.room_calculation.project_name_required'),
        maxlength: I18n.t('js.room_calculation.maxlength')
      },
      'date_of_project':{
        required: I18n.t('js.room_calculation.date_of_project_required'),
      },
      'm_category_id':{
        required: I18n.t('js.room_calculation.m_category_id_required'),
      },
      'number_of_units': {
        digits: I18n.t("js.room_calculation.only_number"),
        min_custom: I18n.t('js.room_calculation.min_1')
      },
      "drc_temperature":{
        required: I18n.t('js.room_calculation.drc_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "drc_relative_humidity":{
        required: I18n.t('js.room_calculation.drc_relative_humidity'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_180')
      },
      "drc_height_above_sea_level":{
        required: I18n.t('js.room_calculation.drc_height_above_sea_level'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_four_hundred'),
        max_custom: I18n.t('js.room_calculation.max_9000')
      },
      "odc_height_above_sea_level":{
        required: I18n.t('js.room_calculation.drc_height_above_sea_level'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_four_hundred'),
        max_custom: I18n.t('js.room_calculation.max_9000')
      },
      "src_height_above_sea_level":{
        required: I18n.t('js.room_calculation.drc_height_above_sea_level'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_four_hundred'),
        max_custom: I18n.t('js.room_calculation.max_9000')
      },
      "dehumidified_room":{
        required: I18n.t('js.room_calculation.dehumidified_room'),
        decimal: I18n.t('js.room_calculation.decimal')
      },
      "odc_temperature":{
        required: I18n.t('js.room_calculation.odc_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "odc_relative_humidity":{
        required: I18n.t('js.room_calculation.odc_relative_humidity'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "src_temperature":{
        required: I18n.t('js.room_calculation.src_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "src_relative_humidity":{
        required: I18n.t('js.room_calculation.src_relative_humidity'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "room_length":{
        required: I18n.t('js.room_calculation.room_length'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "room_width":{
        required: I18n.t('js.room_calculation.room_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "room_height":{
        required: I18n.t('js.room_calculation.room_height'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_7')
      },
      "tightness_of_building":{
        required: I18n.t('js.room_calculation.tightness_of_building'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_1'),
        max_custom: I18n.t('js.room_calculation.max_4')
      },
      "surroundings":{
        required: I18n.t('js.room_calculation.surroundings'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "without_lock_door_height":{
        required: I18n.t('js.room_calculation.without_lock_door_height'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "without_lock_door_width":{
        required: I18n.t('js.room_calculation.without_lock_door_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_doors_height":{
        required: I18n.t('js.room_calculation.air_lock_doors_height'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_doors_width":{
        required: I18n.t('js.room_calculation.air_lock_doors_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_doors_length":{
        required: I18n.t('js.room_calculation.air_lock_doors_length'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "door_to_outdoor_air":{
        required: I18n.t('js.room_calculation.check_door'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "wind_speed":{
        required: I18n.t('js.room_calculation.wind_speed'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "without_lock_opened_per_hour":{
        required: I18n.t('js.room_calculation.without_lock_opened_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_vestibule_passages_per_hour":{
        required: I18n.t('js.room_calculation.air_lock_vestibule_passages_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "open_holes":{
        required: I18n.t('js.room_calculation.open_holes'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "mechanical_ventilation":{
        required: I18n.t('js.room_calculation.mechanical_ventilation'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "number_of_people":{
        required: I18n.t('js.room_calculation.number_people'),
        digits: I18n.t('js.room_calculation.only_number'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "moisture_load_from_each":{
        required: I18n.t('js.room_calculation.moisture_load_from_each'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "pool_length":{
        required: I18n.t('js.room_calculation.pool_length'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "pool_width":{
        required: I18n.t('js.room_calculation.pool_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "water_temperature":{
        required: I18n.t('js.room_calculation.water_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "vaporization_coefficient":{
        required: I18n.t('js.room_calculation.vaporization_coefficient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "total_weight_of_products":{
        required: I18n.t('js.room_calculation.total_weight_of_products'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "start_percentage_of_moisture":{
        required: I18n.t('js.room_calculation.start_percentage_of_moisture'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.min_100')
      },
      "percentage_dried_per_hour":{
        required: I18n.t('js.room_calculation.percentage_dried_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.min_100')
      },
      "other":{
        required: I18n.t('js.room_calculation.other'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "a_dr_model":{
        required: I18n.t('js.room_calculation.a_dr_model'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "b_dry_air_temperature":{
        required: I18n.t('js.room_calculation.b_dry_air_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_process_airflow":{
        required: I18n.t('js.room_calculation.cdej_process_airflow'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_return_air_direct":{
        required: I18n.t('js.room_calculation.cdej_return_air_direct'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_pre_cooled_air":{
        required: I18n.t('js.room_calculation.cdej_pre_cooled_air'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_pre_cooling_ambient":{
        required: I18n.t('js.room_calculation.cdej_pre_cooling_ambient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "cdej_pre_cooling_before":{
        required: I18n.t('js.room_calculation.cdej_pre_cooling_before'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "hgf_pre_cooling":{
        required: I18n.t('js.room_calculation.hgf_pre_cooling'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "hgf_ambient":{
        required: I18n.t('js.room_calculation.hgf_ambient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "start_percentage_of_moisture":{
        required: I18n.t('js.room_calculation.start_percentage_of_moisture'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "percentage_dried_per_hour":{
        required: I18n.t('js.room_calculation.percentage_dried_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "total_load_from_other_sources":{
        required: I18n.t('js.room_calculation.total_load_from_other_sources'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "total_wet_air_flow":{
        required: I18n.t('js.room_calculation.total_wet_air_flow'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "dry_air_temperature":{
        required: I18n.t('js.room_calculation.dry_air_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "process_airflow":{
        required: I18n.t('js.room_calculation.process_airflow'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "return_air_direct":{
        required: I18n.t('js.room_calculation.return_air_direct'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "j_to_a_pre_cooling":{
        required: I18n.t('js.room_calculation.j_to_a_pre_cooling'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "pre_cooled_air":{
        required: I18n.t('js.room_calculation.pre_cooled_air'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "pre_cooling_ambient_air":{
        required: I18n.t('js.room_calculation.pre_cooling_ambient_air'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "air_direct_from_pre_cooling":{
        required: I18n.t('js.room_calculation.air_direct_from_pre_cooling'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_direct_from_ambient":{
        required: I18n.t('js.room_calculation.air_direct_from_ambient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      }
    },
    errorPlacement: function(error, element) {
      var input_boders = ["drc_temperature", "drc_relative_humidity", "drc_height_above_sea_level", "odc_height_above_sea_level", "src_height_above_sea_level", "d_room_has_walls_towards_outdoor", "odc_temperature", "odc_relative_humidity", "src_temperature", "src_relative_humidity", "room_length", "room_width", "room_height", "tightness_of_building", "surroundings", "without_lock_door_height", "without_lock_door_width", "air_lock_doors_height", "air_lock_doors_width", "air_lock_doors_length", "door_to_outdoor_air", "wind_speed", "without_lock_opened_per_hour", "air_lock_vestibule_passages_per_hour", "open_holes", "mechanical_ventilation", "number_of_people", "moisture_load_from_each", "pool_length", "pool_width", "water_temperature", "vaporization_coefficient", "total_weight_of_products", "start_percentage_of_moisture", "percentage_dried_per_hour", "total_load_from_other_sources", "total_wet_air_flow", "dry_air_temperature", "process_airflow", "return_air_direct", "j_to_a_pre_cooling", "pre_cooled_air", "pre_cooling_ambient_air", "air_direct_from_pre_cooling", "air_direct_from_ambient"];
      if ($.inArray(element.attr("name"), input_boders) >= 0) {
        element.css("border-color", "red");
        element.attr("title", error.text());
      }
      else {
        error.insertAfter(element);
      }
    }
  });
}

function new_room_calculation_project_ip(){
  $.validator.addMethod('decimal', function(value, element) {
    return this.optional(element) || /(^[-+]?([0-9]+)+[,.]?([0-9]+)?)$/.test(value);
  }, "Please enter a correct number or decimal");

  $.validator.addMethod('max_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") <= param;
  });

  $.validator.addMethod('min_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") >= param;
  });

  $('.new-room-calculation-project').validate({
    ignore: ":disabled",
    rules:{
      'm_unit_id':{
        required: true
      },
      'project_name': {
        required: true,
        maxlength: 50
      },
      'date_of_project': {
        required: true,
      },
      'm_category_id': {
        required: true,
      },
      'number_of_units': {
        digits: true,
        min_custom: 1
      },
      "drc_temperature":{
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      "drc_relative_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 180
      },
      "drc_atmospheric_pressure":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 2000
      },
      "d_room_has_walls_towards_outdoor":{
        required: true,
        decimal: true
      },
      "odc_temperature":{
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      "odc_relative_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "src_temperature":{
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      "src_relative_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "room_length":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "room_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "room_height":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "tightness_of_building":{
        required: true,
        decimal: true,
        min_custom: 1,
        max_custom: 7
      },
      "surroundings":{
        required: true,
        decimal: true,
        min_custom: 1,
        max_custom: 4
      },
      "without_lock_door_height":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "without_lock_door_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_doors_height":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_doors_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_doors_length":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "door_to_outdoor_air":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "wind_speed":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "without_lock_opened_per_hour":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_lock_vestibule_passages_per_hour":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "open_holes":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "mechanical_ventilation":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "number_of_people":{
        required: true,
        digits: true,
        min_custom: 0
      },
      "moisture_load_from_each":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "pool_length":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "pool_width":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "water_temperature":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom : 100
      },
      "vaporization_coefficient":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "total_weight_of_products":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "start_percentage_of_moisture":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "percentage_dried_per_hour":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "total_load_from_other_sources":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "total_wet_air_flow":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "dry_air_temperature":{
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      "process_airflow":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "return_air_direct":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "j_to_a_pre_cooling":{
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      "pre_cooled_air":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "pre_cooling_ambient_air":{
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      "air_direct_from_pre_cooling":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "air_direct_from_ambient":{
        required: true,
        decimal: true,
        min_custom: 0
      }
    },
    messages:{
      'm_unit_id': {
        required: I18n.t('js.room_calculation.m_unit_id_required')
      },
      'project_name': {
        required: I18n.t('js.room_calculation.project_name_required'),
        maxlength: I18n.t('js.room_calculation.maxlength')
      },
      'date_of_project':{
        required: I18n.t('js.room_calculation.date_of_project_required'),
      },
      'm_category_id':{
        required: I18n.t('js.room_calculation.m_category_id_required'),
      },
      'number_of_units': {
        digits: I18n.t("js.room_calculation.only_number"),
        min_custom: I18n.t('js.room_calculation.min_1')
      },
      "drc_temperature":{
        required: I18n.t('js.room_calculation.drc_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_148'),
        max_custom: I18n.t('js.room_calculation.max_212')
      },
      "drc_relative_humidity":{
        required: I18n.t('js.room_calculation.drc_relative_humidity'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_180')
      },
      "drc_atmospheric_pressure":{
        required: I18n.t('js.room_calculation.drc_atmospheric_pressure'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_2000')
      },
      "dehumidified_room":{
        required: I18n.t('js.room_calculation.dehumidified_room'),
        decimal: I18n.t('js.room_calculation.decimal')
      },
      "odc_temperature":{
        required: I18n.t('js.room_calculation.odc_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_148'),
        max_custom: I18n.t('js.room_calculation.max_212')
      },
      "odc_relative_humidity":{
        required: I18n.t('js.room_calculation.odc_relative_humidity'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "src_temperature":{
        required: I18n.t('js.room_calculation.src_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_148'),
        max_custom: I18n.t('js.room_calculation.max_212')
      },
      "src_relative_humidity":{
        required: I18n.t('js.room_calculation.src_relative_humidity'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "room_length":{
        required: I18n.t('js.room_calculation.room_length'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "room_width":{
        required: I18n.t('js.room_calculation.room_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "room_height":{
        required: I18n.t('js.room_calculation.room_height'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_7')
      },
      "tightness_of_building":{
        required: I18n.t('js.room_calculation.tightness_of_building'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_1'),
        max_custom: I18n.t('js.room_calculation.max_4')
      },
      "surroundings":{
        required: I18n.t('js.room_calculation.surroundings'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "without_lock_door_height":{
        required: I18n.t('js.room_calculation.without_lock_door_height'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "without_lock_door_width":{
        required: I18n.t('js.room_calculation.without_lock_door_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_doors_height":{
        required: I18n.t('js.room_calculation.air_lock_doors_height'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_doors_width":{
        required: I18n.t('js.room_calculation.air_lock_doors_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_doors_length":{
        required: I18n.t('js.room_calculation.air_lock_doors_length'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "door_to_outdoor_air":{
        required: I18n.t('js.room_calculation.check_door'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "wind_speed":{
        required: I18n.t('js.room_calculation.wind_speed'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "without_lock_opened_per_hour":{
        required: I18n.t('js.room_calculation.without_lock_opened_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_lock_vestibule_passages_per_hour":{
        required: I18n.t('js.room_calculation.air_lock_vestibule_passages_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "open_holes":{
        required: I18n.t('js.room_calculation.open_holes'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "mechanical_ventilation":{
        required: I18n.t('js.room_calculation.mechanical_ventilation'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "number_of_people":{
        required: I18n.t('js.room_calculation.number_people'),
        digits: I18n.t('js.room_calculation.only_number'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "moisture_load_from_each":{
        required: I18n.t('js.room_calculation.moisture_load_from_each'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "pool_length":{
        required: I18n.t('js.room_calculation.pool_length'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "pool_width":{
        required: I18n.t('js.room_calculation.pool_width'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "water_temperature":{
        required: I18n.t('js.room_calculation.water_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "vaporization_coefficient":{
        required: I18n.t('js.room_calculation.vaporization_coefficient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "total_weight_of_products":{
        required: I18n.t('js.room_calculation.total_weight_of_products'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "start_percentage_of_moisture":{
        required: I18n.t('js.room_calculation.start_percentage_of_moisture'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.min_100')
      },
      "percentage_dried_per_hour":{
        required: I18n.t('js.room_calculation.percentage_dried_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.min_100')
      },
      "other":{
        required: I18n.t('js.room_calculation.other'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "a_dr_model":{
        required: I18n.t('js.room_calculation.a_dr_model'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "b_dry_air_temperature":{
        required: I18n.t('js.room_calculation.b_dry_air_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_process_airflow":{
        required: I18n.t('js.room_calculation.cdej_process_airflow'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_return_air_direct":{
        required: I18n.t('js.room_calculation.cdej_return_air_direct'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_pre_cooled_air":{
        required: I18n.t('js.room_calculation.cdej_pre_cooled_air'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "cdej_pre_cooling_ambient":{
        required: I18n.t('js.room_calculation.cdej_pre_cooling_ambient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_negative_one_hundred'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "cdej_pre_cooling_before":{
        required: I18n.t('js.room_calculation.cdej_pre_cooling_before'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "hgf_pre_cooling":{
        required: I18n.t('js.room_calculation.hgf_pre_cooling'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "hgf_ambient":{
        required: I18n.t('js.room_calculation.hgf_ambient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "start_percentage_of_moisture":{
        required: I18n.t('js.room_calculation.start_percentage_of_moisture'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "percentage_dried_per_hour":{
        required: I18n.t('js.room_calculation.percentage_dried_per_hour'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0'),
        max_custom: I18n.t('js.room_calculation.max_100')
      },
      "total_load_from_other_sources":{
        required: I18n.t('js.room_calculation.total_load_from_other_sources'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "total_wet_air_flow":{
        required: I18n.t('js.room_calculation.total_wet_air_flow'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "dry_air_temperature":{
        required: I18n.t('js.room_calculation.dry_air_temperature'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_148'),
        max_custom: I18n.t('js.room_calculation.max_212')
      },
      "process_airflow":{
        required: I18n.t('js.room_calculation.process_airflow'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "return_air_direct":{
        required: I18n.t('js.room_calculation.return_air_direct'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "j_to_a_pre_cooling":{
        required: I18n.t('js.room_calculation.j_to_a_pre_cooling'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_148'),
        max_custom: I18n.t('js.room_calculation.max_212')
      },
      "pre_cooled_air":{
        required: I18n.t('js.room_calculation.pre_cooled_air'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "pre_cooling_ambient_air":{
        required: I18n.t('js.room_calculation.pre_cooling_ambient_air'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_148'),
        max_custom: I18n.t('js.room_calculation.max_212')
      },
      "air_direct_from_pre_cooling":{
        required: I18n.t('js.room_calculation.air_direct_from_pre_cooling'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      },
      "air_direct_from_ambient":{
        required: I18n.t('js.room_calculation.air_direct_from_ambient'),
        decimal: I18n.t('js.room_calculation.decimal'),
        min_custom: I18n.t('js.room_calculation.min_0')
      }
    },
    errorPlacement: function(error, element) {
      var input_boders = ["drc_temperature", "drc_relative_humidity", "drc_atmospheric_pressure", "d_room_has_walls_towards_outdoor", "odc_temperature", "odc_relative_humidity", "src_temperature", "src_relative_humidity", "room_length", "room_width", "room_height", "tightness_of_building", "surroundings", "without_lock_door_height", "without_lock_door_width", "air_lock_doors_height", "air_lock_doors_width", "air_lock_doors_length", "door_to_outdoor_air", "wind_speed", "without_lock_opened_per_hour", "air_lock_vestibule_passages_per_hour", "open_holes", "mechanical_ventilation", "number_of_people", "moisture_load_from_each", "pool_length", "pool_width", "water_temperature", "vaporization_coefficient", "total_weight_of_products", "start_percentage_of_moisture", "percentage_dried_per_hour", "total_load_from_other_sources", "total_wet_air_flow", "dry_air_temperature", "process_airflow", "return_air_direct", "j_to_a_pre_cooling", "pre_cooled_air", "pre_cooling_ambient_air", "air_direct_from_pre_cooling", "air_direct_from_ambient"];
      if ($.inArray(element.attr("name"), input_boders) >= 0) {
        element.css("border-color", "red");
        element.attr("title", error.text());
      }
      else {
        error.insertAfter(element);
      }
    }
  });
}

$(document).ready(function() {

  new_room_calculation_project_si()
  $('.general_information_inputs').on('change', '#r003_si_mode',function() {
    $('.new-room-calculation-project').validate().destroy();
    new_room_calculation_project_si();
  });
  $('.general_information_inputs').on('change', '#r003_ip_mode',function() {
    $('.new-room-calculation-project').validate().destroy();
    new_room_calculation_project_ip();
  });
  $('.room-calculation-project-name').on('change', function() {
    $(this).valid();
  });
  $(".calculation_data_inputs").on('blur change', ' #drc-temperature, #drc-relative-humidity, #drc_height_above_sea_level, #odc_height_above_sea_level, #src_height_above_sea_level, #dehumidified-room, #odc-temperature, #odc-relative-humidity, #src-temperature, #src-relative-humidity, #vii-room-length, #vii-room-width, #vii-room-height, #vii-tightness-of-building, #vii-surroundings, #vii-door-height, #vii-door-width, #vii-air-lock-vestibule-height, #vii-air-lock-vestibule-width, #vii-air-lock-vestibule-length, #check-door, #vii-wind-speed, #vii-door-without-air-lock, #vii-air-lock-vestibule, #vii-open-holes, #vii-mechanical-ventilation, #pitr-number-people, #pitr-moisture-load, #ows-pool-length, #ows-pool-width, #ows-water-temperature, #ows-vaporization-coefficient, #pd-total-weight-product, #pd-percentage-moisture, #pd-percentage-dried, #other, #a-dr-model, #b-dry-air-temperature, #cdej-process-airflow, #cdej-return-air-direct, #cdej-pre-cooled-air, #cdej-pre-cooling-ambient, #cdej-pre-cooling-before, #hgf-pre-cooling, #hgf-ambient', function() {
    if ($(this).valid()){
      $(this).removeAttr("title");
      $(this).css("border-color", "#707070");

      tab_pane_id = $(this).closest('.tab-pane').attr('id');
      if ($(`#${tab_pane_id} input.error.text-danger[type!=hidden]`).length == 0) {
        $(`.slick-slide .nav-link[href='#${tab_pane_id}']`).removeClass('error-tab');
      }
    };
  });
});
