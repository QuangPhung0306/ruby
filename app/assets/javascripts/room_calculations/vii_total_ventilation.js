function calculation_vii_total_ventilation(){
  $('.calculation_data_inputs').on('change', '#dehumidified-room, #vii-room-tightness, #vii-door-and-or-air-lock, #src', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_vii_total_ventilation_logic();

  });


  $('.calculation_data_inputs').on('change', '#drc, #odc', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_vii_total_ventilation_logic();

    ventilation = r003_fgh_leakage > r003_vii_total_outdoor ? r003_vii_total_load_ventilation : ((r003_moisture_content_odc-r003_moisture_content_drc)/1000*r003_fgh_leakage*1.2);
    r003_hfg_needed_moisture_content = r003_moisture_content_drc-1000*(r003_tml-ventilation)/r003_fgh_total_airflow/1.2;

    r003_b_needed_moisture_content = (r003_fgh_total_airflow*r003_hfg_needed_moisture_content-r003_b106*r003_moisture_content_odc-r003_b105*r003_cdej_corresponding)/(r003_b88-r003_b102);
    if ($("#r003_si_mode").is(":checked")){
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content).toFixed(2));
      $('#b-needed-moisture-content').val(r003_b_needed_moisture_content.toFixed(2));
      $('.txt_dry_air_needed_moisture_content').html(r003_b_needed_moisture_content.toFixed(2) + ' g/kg').addClass('color_red');
    }else{
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content*7).toFixed(2));
      $('#b-needed-moisture-content').val((r003_b_needed_moisture_content*7).toFixed(2));
      $('.txt_dry_air_needed_moisture_content').html((r003_b_needed_moisture_content*7).toFixed(2) + ' gr/lb').addClass('color_red');
    }
  });


  $('.calculation_data_inputs').on('change', '#vii-mechanical-ventilation, #vii-needed-airflow', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_vii_total_ventilation_logic();

    e110 = b42+r003_vii_needed_airflow+r003_b45;

    r003_cdej_return_air_direct = Math.max(r003_b88-r003_b102-e110-r003_b90,0);
    if ($("#r003_si_mode").is(":checked")){
      $('#cdej-return-air-direct').val(r003_cdej_return_air_direct.toFixed(2)).trigger('change');
    }else{
      $('#cdej-return-air-direct').val((r003_cdej_return_air_direct/1.699).toFixed(2)).trigger('change');
    }
  });

  function calculation_vii_total_ventilation_logic(){
    outdoor_dehumidified_room = parseInt($('#dehumidified-room').val()) == 1 ? 1 : 0;
    outdoor_check_door = parseInt($('#check-door').val()) == 1 ? 1 : 0;
    surrounding_rooms_dehumidified_room = parseInt($('#dehumidified-room').val()) == 1 ? 0 : 1;
    surrounding_rooms_check_door = parseInt($('#check-door').val()) == 1 ? 0 : 1;

    r003_vii_total_outdoor = (r003_b45+r003_room_tightness_vii_tr+r003_vii_needed_airflow)*outdoor_dehumidified_room+r003_vii_infiltration_door_air_clock*outdoor_check_door;
    r003_vii_total_surrounding_rooms = (r003_b45+r003_room_tightness_vii_tr+r003_vii_needed_airflow)*surrounding_rooms_dehumidified_room+r003_vii_infiltration_door_air_clock*surrounding_rooms_check_door;

    r003_vii_percentage = 100*(r003_vii_total_outdoor+r003_vii_total_surrounding_rooms)/r003_room_volume_vii_tr;
    r003_vii_total_load_ventilation = (r003_vii_total_outdoor*(r003_moisture_content_odc-r003_moisture_content_drc)+r003_vii_total_surrounding_rooms*(r003_moisture_content_src-r003_moisture_content_drc))*1.2/1000

    if ($("#r003_si_mode").is(":checked")){
      $('#vii-total-ventilation-from-outdoor').val(r003_vii_total_outdoor.toFixed(2)).trigger('change', ['false']);
      $('#vii-total-ventilation-from-surrounding-rooms').val(r003_vii_total_surrounding_rooms.toFixed(2));
      $('#vii-percentage-leakage').val(r003_vii_percentage.toFixed(2));
      $('#vii-total-load-from-ventilation').val(r003_vii_total_load_ventilation.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#vii-total-ventilation-from-outdoor').val((r003_vii_total_outdoor/1.699).toFixed(2)).trigger('change', ['false']);
      $('#vii-total-ventilation-from-surrounding-rooms').val((r003_vii_total_surrounding_rooms/1.699).toFixed(2));
      $('#vii-percentage-leakage').val(r003_vii_percentage.toFixed(2));
      $('#vii-total-load-from-ventilation').val((r003_vii_total_load_ventilation*2.204623).toFixed(2)).trigger('change', ['false']);
    }
  }

}

$(document).ready(function() {
  calculation_vii_total_ventilation();
});
