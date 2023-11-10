function calculation_vii_door_air_clock(){
  $('.calculation_data_inputs').on('change', '#vii-door-height, #vii-door-width, #vii-air-lock-vestibule-height, #vii-air-lock-vestibule-width, #vii-air-lock-vestibule-length, #vii-door-without-air-lock, #vii-air-lock-vestibule, #check-door', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    b38 = parseFloat($('#check-door').val()) == 1 ? r003_b38/2 : 0.25;
    c38 = parseFloat($('#check-door').val()) == 1 ? r003_b38/4 : 0.25;

    r003_vii_infiltration_door_air_clock = b38*r003_b34*r003_c34*3600*r003_b39/60+r003_b40*r003_d35*r003_c35*r003_b35/2+2*((r003_b34+r003_c34))*0.0005*0.8*3600;

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
}

$(document).ready(function() {
  calculation_vii_door_air_clock();
});
