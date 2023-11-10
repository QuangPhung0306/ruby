function calculation_b(){
  $('.calculation_data_inputs').on('change', '#b-dry-air-temperature, #hgf-total-airflow, #hgf-needed-moisture-content', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_b_logic()
  });

  $('.calculation_data_inputs').on('change', '#a-dr-model', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    calculation_b_logic()

    r003_cdej_return_air_direct = Math.max(r003_b88-r003_b102-e110-r003_b90,0);
    if ($("#r003_si_mode").is(":checked")){
      $('#cdej-return-air-direct').val(r003_cdej_return_air_direct.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#cdej-return-air-direct').val((r003_cdej_return_air_direct/1.699).toFixed(2)).trigger('change', ['false']);
    }
  });

  $('.calculation_data_inputs').on('change', '#b-needed-moisture-content, #cdej-temperature, #cdej-moisture-content, #hgf-pre-cooling, #hgf-ambient', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    r003_b_dry_air_temperature = r003_b99+(r003_cdej_moisture_content-r003_b_needed_moisture_content)*2.5+5;
    if ($("#r003_si_mode").is(":checked")){
      $('#b-dry-air-temperature').val(r003_b_dry_air_temperature.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#b-dry-air-temperature').val((r003_b_dry_air_temperature*1.8+32).toFixed(2)).trigger('change', ['false']);
    }
  });
}
function calculation_b_logic(){
  r003_b112 = r003_b88-r003_b102
  r003_b_needed_moisture_content = (r003_fgh_total_airflow*r003_hfg_needed_moisture_content-r003_b106*r003_moisture_content_odc-r003_b105*r003_cdej_corresponding)/(r003_b88-r003_b102);
  r003_b_heat_load = ((r003_b_dry_air_temperature-r003_b7)*(r003_b88-r003_b102)+(r003_b91-r003_b7)*r003_b105+(r003_b13-r003_b7)*r003_b106)*1.02/3000;

  if ($("#r003_si_mode").is(":checked")){
    $('#b-total-dry-air-flow').val(r003_b112.toFixed(2)).trigger('change', ['false']);
    $('#b-needed-moisture-content').val(r003_b_needed_moisture_content.toFixed(2));
    $('.txt_dry_air_needed_moisture_content').html(r003_b_needed_moisture_content.toFixed(2) + ' g/kg').addClass('color_red');
    $('#b-heat-load').val(r003_b_heat_load.toFixed(2));
  } else {
    $('#b-total-dry-air-flow').val((r003_b112/1.699).toFixed(2)).trigger('change', ['false']);
    $('#b-needed-moisture-content').val((r003_b_needed_moisture_content*7).toFixed(2));
    $('.txt_dry_air_needed_moisture_content').html((r003_b_needed_moisture_content*7).toFixed(2) + ' gr/lb').addClass('color_red');
    $('#b-heat-load').val((r003_b_heat_load*1000/0.29307107).toFixed(2));
  }
}

$(document).ready(function() {
  calculation_b();
});
