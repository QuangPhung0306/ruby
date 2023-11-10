function calculation_vii_room_tightness(){
  $('.calculation_data_inputs').on('change', '#vii-room-length, #vii-room-width, #vii-room-height', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_vii_room_tightness_logic();
  });

  $('.calculation_data_inputs').on('change', '#vii-tightness-of-building, #vii-surroundings', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_vii_room_tightness_select_box_logic();
  });

  $('.calculation_data_inputs').on('change', '#vii-wind-speed', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_vii_room_tightness_logic();

    b38 = parseFloat($('#check-door').val()) == 1 ? r003_b38/2 : 0.25;
    r003_vii_infiltration_door_air_clock = b38*r003_b34*r003_c34*3600*r003_b39/60+r003_b40*r003_d35*r003_c35*r003_b35/2+2*((r003_b34+r003_c34))*0.0005*0.8*3600;


    c38 = parseFloat($('#check-door').val()) == 1 ? r003_b38/4 : 0.25;
    b42 = (c38)*r003_b34*r003_c34*3600*(r003_b39/2)/60+(r003_b40/2)*r003_d35*r003_c35*r003_b35/2+2*((r003_b34+r003_c34))*0.0005*0.4*3600;

    e110 = b42+r003_vii_needed_airflow+r003_b45;

    r003_cdej_return_air_direct = Math.max(r003_b88-r003_b102-e110-r003_b90,0);
    if ($("#r003_si_mode").is(":checked")) {
      $('#vii-door-and-or-air-lock').val(r003_vii_infiltration_door_air_clock.toFixed(2)).trigger('change', ['false']);
      $('#cdej-return-air-direct').val(r003_cdej_return_air_direct.toFixed(2)).trigger('change');
    } else {
      $('#vii-door-and-or-air-lock').val((r003_vii_infiltration_door_air_clock/1.699).toFixed(2)).trigger('change', ['false']);
      $('#cdej-return-air-direct').val((r003_cdej_return_air_direct/1.699).toFixed(2)).trigger('change');
    }
  });

  $('.calculation_data_inputs').on('change', '#vii-open-holes', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    r003_vii_needed_airflow = r003_b43*0.8*3600;
    e110 = b42+r003_vii_needed_airflow+r003_b45;

    r003_cdej_return_air_direct = Math.max(r003_b88-r003_b102-e110-r003_b90,0);
    if ($("#r003_si_mode").is(":checked")) {
      $('#vii-needed-airflow').val(r003_vii_needed_airflow.toFixed(2)).trigger('change', ['false']);
      $('#cdej-return-air-direct').val(r003_cdej_return_air_direct.toFixed(2)).trigger('change', ['false']);
    }
    else {
      $('#vii-needed-airflow').val((r003_vii_needed_airflow/1.699).toFixed(2)).trigger('change', ['false']);
      $('#cdej-return-air-direct').val((r003_cdej_return_air_direct/1.699).toFixed(2)).trigger('change', ['false']);
    }
  });
}

function calculation_vii_room_tightness_logic(){
  tightness_of_building = parseInt($('#vii-tightness-of-building').val());
  surroundings = parseInt($('#vii-surroundings').val());
  r003_room_volume_vii_tr = r003_b27*r003_b29*r003_b28;
  r003_room_tightness_vii_tr = (0.075+tightness_of_building/7*(1.08-0.075))*r003_b38/9*(3.76+surroundings)/7.76*((r003_b27+r003_b28)*r003_b29*2+r003_b27*r003_b28);

  if ($("#r003_si_mode").is(":checked")){
    $('#vii-room-volume').val(r003_room_volume_vii_tr.toFixed(2));
    $('#vii-room-tightness').val(r003_room_tightness_vii_tr.toFixed(2)).trigger('change', ['false']);
  } else {
    $('#vii-room-volume').val((r003_room_volume_vii_tr/0.0283168).toFixed(2));
    $('#vii-room-tightness').val((r003_room_tightness_vii_tr/1.699).toFixed(2)).trigger('change', ['false']);
  }
}

function calculation_vii_room_tightness_select_box_logic(){
  tightness_of_building = parseInt($('#vii-tightness-of-building').val());
  surroundings = parseInt($('#vii-surroundings').val());
  r003_room_tightness_vii_tr = (0.075+tightness_of_building/7*(1.08-0.075))*r003_b38/9*(3.76+surroundings)/7.76*((r003_b27+r003_b28)*r003_b29*2+r003_b27*r003_b28);

  if ($("#r003_si_mode").is(":checked")){
    $('#vii-room-tightness').val(r003_room_tightness_vii_tr.toFixed(2)).trigger('change', ['false']);
  } else {
    $('#vii-room-tightness').val((r003_room_tightness_vii_tr/1.699).toFixed(2)).trigger('change', ['false']);
  }
}

$(document).ready(function() {
  calculation_vii_room_tightness();
});
