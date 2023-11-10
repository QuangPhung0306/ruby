var r003_moisture_content_drc = 7.265884708046152; //b10
var r003_moisture_content_src = 11.898242268735805; //b22
var r003_moisture_content_odc = 11.898242268735805; //b16
var r003_room_volume_vii_tr = 75; //b30
var r003_room_tightness_vii_tr = 28.36170839469808; //b41
var r003_vii_infiltration_door_air_clock = 8.64; //b42
var r003_vii_needed_airflow = 0; //b44
var r003_vii_total_outdoor = 28.36170839469808; //b46
var r003_vii_total_surrounding_rooms = 8.64; //b47
var r003_vii_percentage = 49.33561119293078; //b48
var r003_vii_total_load_ventilation = 0.20568617236873615; //b49
var r003_pitr = 0; //b54
var r003_ows_pool_surface = 0; //b59
var r003_total_water_surface = 0; //b62
var r003_pd = 0; //b68
var r003_other = 0; //b71
var r003_tml = 0.20568617236873615; //b73
var r003_cdej_corresponding = 8.735871626032475; //b92
var r003_cdej_ambient_air = 44.31999999999999; //b93
var r003_cdej_pre_cooler1 = 20.963478260869568; //b94
var r003_cdej_pre_cooler2 = 8.158519869306001; //b95
var r003_cdej_moisture_content = 8.158519869306001; //b100
var r003_fgh_total_airflow = 190; //b107
var r003_b_needed_moisture_content = 6.469077555528077; //b113
var r003_cdej_return_air_direct = 185.68; //b89
var r003_hfg_needed_moisture_content = 6.469077555528077; //b108
var r003_b_dry_air_temperature = 30.18708404531438; //b116
var r003_fgh_leakage = 4.319999999999993; //b110
var r003_b_heat_load = 0.6580856293273089; //b117
var r003_final_corresponding_to = 7.265884708046152
var r003_start_corresponding_to = 11.898242268735805
var r003_b120 = 25;
var r003_b121 = 11.898242268735805;
var r003_b124 = 25;
var r003_b125 = 11.898242268735805;
var r003_base_atmospheric_pressure = 1014;
var r003_b7 = 20;
var r003_b8 = 50;
var r003_b9 = 1014;
var r003_b13 = 25;
var r003_b14 = 60;
var r003_b15 = 1014;
var r003_b19 = 25;
var r003_b20 = 60;
var r003_b21 = 1014;
var r003_b27 = 5;
var r003_b28 = 5;
var r003_b29 = 3;
var r003_b34 = 2;
var r003_c34 = 1;
var r003_b35 = 0;
var r003_c35 = 0;
var r003_d35 = 0;
var r003_b38 = 8;
var r003_b39 = 0;
var r003_b40 = 0;
var r003_b43 = 0;
var r003_b45 = 0;
var r003_b52 = 0;
var r003_b53 = 0.15;
var r003_b57 = 0;
var r003_b58 = 0;
var r003_b60 = 20;
var r003_b61 = 7;
var r003_b65 = 0;
var r003_b66 = 0.12;
var r003_b67 = 0.05;
var r003_b88 = 230;
var r003_b90 = 0;
var r003_b91 = 12;
var r003_b96 = 20.963478260869568;
var r003_b99 = 20.963478260869568;
var r003_b102 = 40;
var r003_b105 = 0;
var r003_b106 = 0;
var r003_b112 = 190;

var check_mode = false;
var sort_units = $(".dropdown-item.dropdown-unit").sort(function(a, b) {
  var aCapacity = $(a).data("capacity");
  var bCapacity = $(b).data("capacity");

  if(aCapacity < bCapacity) {
    return -1;
  }
  if(aCapacity > bCapacity) {
    return 1;
  }
  return 0;
});

sort_unit_recusords = [];
sort_unit_consords = [];
for (i = 0; i < sort_units.length; i++){
  if ($(sort_units[i]).data('category-id') == 1) {
    sort_unit_recusords.push(sort_units[i]);
  }
  else{
    sort_unit_consords.push(sort_units[i]);
  }
}

$(document).ready(function () {
  if ($('#correction_factor').length == 1) {
    $(".category_and_unit").on("click", ".dropdown_sl a",function() {
      var html = $(this).text();
      $(this).parent().siblings(".btn_ct_sl").html(html).addClass("color_green");
    });
  }

  //   $('.r003_input').on('keyup keypress', function(e) {
  //     var keyCode = e.keyCode || e.which;
  //     if (keyCode === 13) {
  //       e.preventDefault();
  //       return false;
  //     }
  //   });

  //   units = document.querySelectorAll(".dropdown-unit");
  //   unit_recusords = [];
  //   unit_consords = [];
  //   for (i = 0; i < units.length; i++){
  //     if ($(units[i]).data('category-id') == 1) {
  //       unit_recusords.push(units[i]);
  //     }
  //     else{
  //       unit_consords.push(units[i]);
  //     }
  //   }

  //   correction_factor = jQuery.parseJSON($('#correction_factor').val());
  //   for_0c_1s = [];
  //   for_0c_2s = [];
  //   for_10c_1s = [];
  //   for_10c_2s = [];
  //   for_20c_1s = [];
  //   for_20c_2s = [];
  //   for_30c_1s = [];
  //   for_30c_2s = [];

  //   for (i = 0; i < correction_factor.length; i++){
  //     if (correction_factor[i].temperature == 0) {
  //       if (correction_factor[i].unit_type == 2){
  //         for_0c_1s.push(correction_factor[i]);
  //       }
  //       else{
  //         for_0c_2s.push(correction_factor[i]);
  //       }
  //     }
  //     else if (correction_factor[i].temperature == 10) {
  //       if (correction_factor[i].unit_type == 2){
  //         for_10c_1s.push(correction_factor[i]);
  //       }
  //       else{
  //         for_10c_2s.push(correction_factor[i]);
  //       }
  //     }
  //     else if (correction_factor[i].temperature == 20) {
  //       if (correction_factor[i].unit_type == 2){
  //         for_20c_1s.push(correction_factor[i]);
  //       }
  //       else{
  //         for_20c_2s.push(correction_factor[i]);
  //       }
  //     }
  //     else if (correction_factor[i].temperature == 30) {
  //       if (correction_factor[i].unit_type == 2){
  //         for_30c_1s.push(correction_factor[i]);
  //       }
  //       else{
  //         for_30c_2s.push(correction_factor[i]);
  //       }
  //     }
  //   }

  //   $('.r003_input').on('change', '#room_calculation_category_id, #number_of_units, #tml', function(){
  //     desired_temperature = convert_comma_to_dot($('#drc-temperature').val());
  //     number_of_units = parseInt($('#number_of_units').val());
  //     compare_value = r003_tml/number_of_units;

  //     if ($('#drc-relative-humidity').val() != ""){
  //       var for_20c = 0.02;
  //       var for_0c = 0.02;
  //       var for_10c = 0.02;
  //       var for_30c = 0.02;

  //       if ($('#room_calculation_category_id').val() == 1){
  //         for (i11 = 0; i11 < for_0c_1s.length; i11++){
  //           if (for_0c_1s[i11].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_0c = for_0c_1s[i11].factor_k;
  //           }
  //           else {break;}
  //         }
  //         for (i12 = 0; i12 < for_10c_1s.length; i12++){
  //           if (for_10c_1s[i12].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_10c = for_10c_1s[i12].factor_k;
  //           }
  //           else {break;}
  //         }
  //         for (i13 = 0; i13 < for_20c_1s.length; i13++){
  //           if (for_20c_1s[i13].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_20c = for_20c_1s[i13].factor_k;
  //           }
  //           else {break;}
  //         }
  //         for (i14 = 0; i14 < for_30c_1s.length; i14++){
  //           if (for_30c_1s[i14].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_30c =  for_30c_1s[i14].factor_k;
  //           }
  //           else {break;}
  //         }
  //       }
  //       else{
  //         for (i21 = 0; i21 < for_0c_2s.length; i21++){
  //           if (for_0c_2s[i21].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_0c = for_0c_2s[i21].factor_k;
  //           }
  //           else {break;}
  //         }
  //         for (i22 = 0; i22 < for_10c_2s.length; i22++){
  //           if (for_10c_2s[i22].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_10c = for_10c_2s[i22].factor_k;
  //           }
  //           else {break;}
  //         }
  //         for (i23 = 0; i23 < for_20c_2s.length; i23++){
  //           if (for_20c_2s[i23].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_20c = for_20c_2s[i23].factor_k;
  //           }
  //           else {break;}
  //         }
  //         for (i24 = 0; i24 < for_30c_2s.length; i24++){
  //           if (for_30c_2s[i24].factor_correction <= convert_comma_to_dot($('#drc-relative-humidity').val())) {
  //             for_30c =  for_30c_2s[i24].factor_k;
  //           }
  //           else {break;}
  //         }
  //       }
  //       tmp1 = desired_temperature < 30 ? (for_20c+(desired_temperature-20)/10*(for_30c-for_20c)) : for_30c;
  //       tmp2 = desired_temperature < 20 ? (for_10c+(desired_temperature-10)/10*(for_20c-for_10c)) : tmp1;
  //       tmp3 = desired_temperature < 10 ? (for_0c+(desired_temperature-0)/10*(for_10c-for_0c)) : tmp2;
  //       room_tmp = desired_temperature < 0 ? for_0c : tmp3;
  //       korrigering = 1-(r003_moisture_content_odc-r003_moisture_content_drc)/25*0.35;

  //       correction_factor_k = room_tmp*korrigering;
  //       w44 = compare_value/correction_factor_k;
  //       ar26 = compare_value/room_tmp;
  //       ($('#room_calculation_category_id').val() == 1) ? unit_calculation(w44, unit_recusords, number_of_units) : unit_calculation(ar26, unit_consords, number_of_units);
  //     }
  //   });

  //   function unit_calculation(compare, capacity_of_units, number_of_units) {
  //     var recommended_units = [];
  //     for(i = 0; i < capacity_of_units.length; i++){
  //       recommended_unit = capacity_of_units[i];
  //       if ($(recommended_unit).data('capacity') > compare) {
  //         recommended_units.push(recommended_unit);
  //       }
  //     }
  //     var index = 0;
  //     var min_capacity = parseFloat($(recommended_units[0]).data('capacity'));
  //     for(j = 0; j < recommended_units.length; j++) {
  //       min = parseFloat($(recommended_units[j]).data('capacity'));
  //       if (min < min_capacity) {
  //         min_capacity = min;
  //         index = j;
  //       }
  //     }

  //     dry_air = $(recommended_units[index]).data('dry-air');
  //     wet_air = $(recommended_units[index]).data('wet-air');
  //     $(recommended_units[index]).click();
  //     b88 = dry_air*number_of_units;

  //     wet_air_b102 = ($('#room_calculation_category_id').val() == 1) ? wet_air*number_of_units : 0;
  //     $('#cdej-process-airflow').val(b88).trigger('change');
  //     $('#a-dr-model').val(wet_air_b102).trigger('change');
  //   }
  // }

  $('#save_project').click(function() {
    if (typeof(si_mode) == 'undefined') {
      r003_capacity_at_starting_climate = convert_comma_to_dot($("input[name=start_capacity]").val())
      r003_capacity_at_final_climate = convert_comma_to_dot($("input[name=final_capacity]").val())
      r003_xp2 = convert_comma_to_dot($("input[name=result_xp2]").val())
      r003_tp2 = convert_comma_to_dot($("input[name=result_tp2]").val())
      r003_mr = convert_comma_to_dot($("input[name=result_mr]").val())
    } else {
      r003_capacity_at_starting_climate = si_mode.starting_capacity
      r003_capacity_at_final_climate = si_mode.capacity_at_final_climate
      r003_xp2 = si_mode.xp2
      r003_tp2 = si_mode.tp2
      r003_mr = si_mode.mr
    }

    myData = {
      project_name: $("input[name=project_name]").val(),
      date_of_project: $("input[name=date_of_project]").val(),
      height_above_sea_level: convert_comma_to_dot($('#drc_height_above_sea_level').val()),
      drc_temperature: r003_b7,
      drc_relative_humidity: r003_b8,
      drc_atmospheric_pressure: r003_b9,
      drc_moisture_content: r003_moisture_content_drc,
      d_room_has_walls_towards_outdoor: convert_comma_to_dot($("select[name=d_room_has_walls_towards_outdoor]").val()),
      odc_temperature: r003_b13,
      odc_relative_humidity: r003_b14,
      odc_atmospheric_pressure: r003_b15,
      odc_moisture_content: r003_moisture_content_odc,
      src_temperature: r003_b19,
      src_relative_humidity: r003_b20,
      src_atmospheric_pressure: r003_b21,
      src_moisture_content: r003_moisture_content_src,
      room_length: r003_b27,
      room_width: r003_b28,
      room_height: r003_b29,
      room_volume: r003_room_volume_vii_tr,
      tightness_of_building: convert_comma_to_dot($("select[name=tightness_of_building]").val()),
      surroundings: convert_comma_to_dot($("select[name=surroundings]").val()),
      without_lock_door_height: r003_b34,
      without_lock_door_width: r003_c34,
      air_lock_doors_height: r003_b35,
      air_lock_doors_width: r003_c35,
      air_lock_doors_length: r003_d35,
      door_to_outdoor_air: convert_comma_to_dot($("select[name=door_to_outdoor_air]").val()),
      wind_speed: r003_b38,
      without_lock_opened_per_hour: r003_b39,
      air_lock_vestibule_passages_per_hour: r003_b40,
      tightness_of_room: r003_room_tightness_vii_tr,
      door_or_air_lock_infiltration: r003_vii_infiltration_door_air_clock,
      open_holes: r003_b43,
      needed_airflow: r003_vii_needed_airflow,
      mechanical_ventilation: r003_b45,
      total_ventilation_from_outdoor: r003_vii_total_outdoor,
      total_ventilation_from_surrounding_rooms: r003_vii_total_surrounding_rooms,
      percentage_leakage: r003_vii_percentage,
      total_load_from_ventilation: r003_vii_total_load_ventilation,
      number_of_people: convert_comma_to_dot($("input[name=number_of_people]").val()),
      moisture_load_from_each: r003_b53,
      total_load_from_people: r003_pitr,
      pool_length: r003_b57,
      pool_width: r003_b58,
      pool_surface: r003_ows_pool_surface,
      water_temperature: r003_b60,
      vaporization_coefficient: r003_b61,
      total_load_from_water_surface: r003_total_water_surface,
      total_weight_of_products: r003_b65,
      start_percentage_of_moisture: r003_b66,
      percentage_dried_per_hour: r003_b67,
      total_load_from_product_drying: r003_pd,
      total_load_from_other_sources: r003_other,
      total_moisture_load: r003_tml,
      total_wet_air_flow: r003_b102,
      total_dry_air_flow: r003_b112,
      dry_air_needed_moisture_content: r003_b_needed_moisture_content,
      dry_air_temperature: r003_b_dry_air_temperature,
      heat_load: r003_b_heat_load,
      air_direct_from_pre_cooling: r003_b105,
      air_direct_from_ambient: r003_b106,
      total_airflow_to_room: r003_fgh_total_airflow,
      air_mix_needed_moisture_content: r003_hfg_needed_moisture_content,
      leakage: r003_fgh_leakage,
      process_airflow: r003_b88,
      return_air_direct: r003_cdej_return_air_direct,
      pre_cooled_air: r003_b90,
      pre_cooling_ambient_air: r003_b91,
      corresponding_to: r003_cdej_corresponding,
      ambient_air_direct: r003_cdej_ambient_air,
      j_before_pre_cooler_degree: r003_cdej_pre_cooler1,
      j_before_pre_cooler_rate: r003_cdej_pre_cooler2,
      j_to_a_pre_cooling: r003_b96,
      inlet_temperature: r003_b99,
      inlet_moisture_content: r003_cdej_moisture_content,
      j_before_pre_cooler_degree_start: r003_b120,
      j_before_pre_cooler_rate_start: r003_b121,
      inlet_temperature_start: r003_b124,
      inlet_moisture_content_start: r003_b125,
      m_category_id: convert_comma_to_dot($("input[name=m_category_id]").val()),
      m_unit_id: convert_comma_to_dot($("input[name=m_unit_id]").val()),
      number_of_units: convert_comma_to_dot($("input[name=number_of_units]").val()),
      start_capacity: r003_capacity_at_starting_climate,
      final_capacity: r003_capacity_at_final_climate,
      result_xp2: r003_xp2,
      result_tp2: r003_tp2,
      result_mr: r003_mr,
      authenticity_token: AUTH_TOKEN
    }

    $.LoadingOverlay("show");
    $.ajax({
      url: '/room_calculation',
      type: 'POST',
      data: myData,
      dataType: 'script',
      success: function(data) {
        $.LoadingOverlay("hide");
      },
      error: function(data) {
        $.LoadingOverlay("hide");
      }
    });
  });


});
