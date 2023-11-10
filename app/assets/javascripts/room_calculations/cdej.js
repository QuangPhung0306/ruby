function calculation_cdej(){
  $('.calculation_data_inputs').on('change', '#start_temperature, #starting_corresponding_to, #cdej-pre-cooling-ambient', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    cdej_logic();
  });

  $('.calculation_data_inputs').on('change', '#cdej-process-airflow', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    cdej_logic();

    c38 = parseFloat($('#check-door').val()) == 1 ? r003_b38/4 : 0.25;
    b42 = (c38)*r003_b34*r003_c34*3600*(r003_b39/2)/60+(r003_b40/2)*r003_d35*r003_c35*r003_b35/2+2*((r003_b34+r003_c34))*0.0005*0.4*3600;
    e110 = b42+r003_vii_needed_airflow+r003_b45;

    r003_b112 = r003_b88-r003_b102
    r003_fgh_total_airflow = r003_b106+r003_b105+r003_b88-r003_b102;
    r003_cdej_return_air_direct = Math.max(r003_b88-r003_b102-e110-r003_b90,0);
    r003_fgh_leakage = r003_b105+r003_b106+r003_b112-r003_cdej_return_air_direct;
    ventilation = r003_fgh_leakage > r003_vii_total_outdoor ? r003_vii_total_load_ventilation : ((r003_moisture_content_odc-r003_moisture_content_drc)/1000*r003_fgh_leakage*1.2);
    r003_hfg_needed_moisture_content = r003_moisture_content_drc-1000*(r003_tml-ventilation)/r003_fgh_total_airflow/1.2;
    r003_b_needed_moisture_content = (r003_fgh_total_airflow*r003_hfg_needed_moisture_content-r003_b106*r003_moisture_content_odc-r003_b105*r003_cdej_corresponding)/(r003_b88-r003_b102);
    r003_b_heat_load = ((r003_b_dry_air_temperature-r003_b7)*(r003_b88-r003_b102)+(r003_b91-r003_b7)*r003_b105+(r003_b13-r003_b7)*r003_b106)*1.02/3000;



    if ($("#r003_si_mode").is(":checked")){
      $('#b-total-dry-air-flow').val(r003_b112.toFixed(2)).trigger('change', ['false']);
      $('#b-needed-moisture-content').val(r003_b_needed_moisture_content.toFixed(2)).trigger('change', ['false']);
      $('.txt_dry_air_needed_moisture_content').html(r003_b_needed_moisture_content.toFixed(2) + ' g/kg').addClass('color_red');
      $('#b-heat-load').val(r003_b_heat_load.toFixed(2));

      $('#hgf-total-airflow').val(r003_fgh_total_airflow.toFixed(2));
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content).toFixed(2)).trigger('change', ['false']);
      $('#cdej-return-air-direct').val(r003_cdej_return_air_direct.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#b-total-dry-air-flow').val((r003_b112/1.699).toFixed(2)).trigger('change', ['false']);
      $('#b-needed-moisture-content').val((r003_b_needed_moisture_content*7).toFixed(2)).trigger('change', ['false']);
      $('.txt_dry_air_needed_moisture_content').html((r003_b_needed_moisture_content*7).toFixed(2) + ' gr/lb').addClass('color_red');
      $('#b-heat-load').val((r003_b_heat_load*1000/0.29307107).toFixed(2));

      $('#hgf-total-airflow').val((r003_fgh_total_airflow/1.699).toFixed(2));
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content*7).toFixed(2)).trigger('change', ['false']);
      $('#cdej-return-air-direct').val((r003_cdej_return_air_direct/1.699).toFixed(2)).trigger('change', ['false']);
    }
  });

  $('.calculation_data_inputs').on('change', '#cdej-return-air-direct', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    cdej_logic();
    r003_fgh_leakage = r003_b105+r003_b106+r003_b112-r003_cdej_return_air_direct;
    r003_fgh_total_airflow = r003_b106+r003_b105+r003_b88-r003_b102;

    ventilation = r003_fgh_leakage > r003_vii_total_outdoor ? r003_vii_total_load_ventilation : ((r003_moisture_content_odc-r003_moisture_content_drc)/1000*r003_fgh_leakage*1.2);
    r003_hfg_needed_moisture_content = r003_moisture_content_drc-1000*(r003_tml-ventilation)/r003_fgh_total_airflow/1.2;
    if ($("#r003_si_mode").is(":checked")){
      $('#hgf-total-airflow').val(r003_fgh_total_airflow.toFixed(2));
      $('#hgf-leakage').val(r003_fgh_leakage.toFixed(2));
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content).toFixed(2)).trigger('change', ['false']);
    } else {
      $('#hgf-total-airflow').val((r003_fgh_total_airflow/1.699).toFixed(2));
      $('#hgf-leakage').val((r003_fgh_leakage/1.699).toFixed(2));
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content*7).toFixed(2)).trigger('change', ['false']);
    }
  });

  $('.calculation_data_inputs').on('change', '#cdej-pre-cooled-air', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    cdej_logic();
    c38 = parseFloat($('#check-door').val()) == 1 ? r003_b38/4 : 0.25;
    b42 = (c38)*r003_b34*r003_c34*3600*(r003_b39/2)/60+(r003_b40/2)*r003_d35*r003_c35*r003_b35/2+2*((r003_b34+r003_c34))*0.0005*0.4*3600;
    e110 = b42+r003_vii_needed_airflow+r003_b45;
    r003_cdej_return_air_direct = Math.max(r003_b88-r003_b102-e110-r003_b90,0);
    if ($("#r003_si_mode").is(":checked")){
      $('#cdej-return-air-direct').val(r003_cdej_return_air_direct.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#cdej-return-air-direct').val((r003_cdej_return_air_direct/1.699).toFixed(2)).trigger('change', ['false']);
    }
  });

  $('.calculation_data_inputs').on('change', '#cdej-pre-cooling-before', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    r003_b99 = r003_b96;
    r003_b124 = convert_comma_to_dot($('#cdej-pre-cooling-before').val()) == convert_comma_to_dot($('#cdej-before-pre-cooler1').val()) ? r003_b120 : r003_b96;
    r003_b125 = 622/(r003_b15/Math.exp(12.03-4025/(r003_b124+235))/10/100-1) < r003_b121 ? 622/(r003_b15/Math.exp(12.03-4025/(r003_b124+235))/10/100-1) : r003_b121;
    r003_cdej_moisture_content = 622/(r003_b15/Math.exp(12.03-4025/(r003_b96+235))/10/100-1) < r003_cdej_pre_cooler2 ? 622/(r003_b15/Math.exp(12.03-4025/(r003_b96+235))/10/100-1) : r003_cdej_pre_cooler2 ;
    r003_b_dry_air_temperature = r003_b99+(r003_cdej_moisture_content-r003_b_needed_moisture_content)*2.5+5;

    if ($("#r003_si_mode").is(":checked")){
      $('#cdej-temperature').val(convert_comma_to_dot($('#cdej-pre-cooling-before').val()).toFixed(2)).trigger('change', ['false']);
      $('#inlet_temperature_start').val(r003_b124.toFixed(2)).trigger('change', ['false']);
      $('#cdej-moisture-content').val(r003_cdej_moisture_content.toFixed(2));
      $('#inlet_moisture_content_start').val(r003_b125.toFixed(2)).trigger('change')
      $('#b-dry-air-temperature').val(r003_b_dry_air_temperature.toFixed(2)).trigger('change', ['false']);
      $('#cdej-temperature').val(r003_b99.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#cdej-temperature').val((convert_comma_to_dot($('#cdej-pre-cooling-before').val())*1.8+32).toFixed(2)).trigger('change', ['false']);
      $('#inlet_temperature_start').val((r003_b124*1.8+32).toFixed(2)).trigger('change', ['false']);
      $('#cdej-moisture-content').val((r003_cdej_moisture_content*7).toFixed(2));
      $('#inlet_moisture_content_start').val((r003_b125*7).toFixed(2)).trigger('change')
      $('#b-dry-air-temperature').val((r003_b_dry_air_temperature*1.8+32).toFixed(2)).trigger('change', ['false']);
      $('#cdej-temperature').val((r003_b99*1.8+32).toFixed(2)).trigger('change', ['false']);
    }
  });
}

function cdej_logic(){
  if ($("#r003_si_mode").is(":checked")){
    b132 = convert_comma_to_dot($('#start_temperature').val());
  } else {
    b132 = (convert_comma_to_dot($('#start_temperature').val())-32)/1.8;
  }

  r003_cdej_corresponding = Math.min(622/(r003_b15/Math.exp(12.03-4025/(r003_b91+235))/1000-1),r003_moisture_content_odc);
  r003_cdej_ambient_air = r003_b88-r003_b90-r003_cdej_return_air_direct+r003_b105;
  r003_cdej_pre_cooler1 = (r003_cdej_return_air_direct*r003_b7+(r003_b90-r003_b105)*r003_b91+r003_cdej_ambient_air*r003_b13)/r003_b88;
  r003_cdej_pre_cooler2 = (r003_cdej_return_air_direct*r003_moisture_content_drc+(r003_b90-r003_b105)*r003_cdej_corresponding+r003_cdej_ambient_air*r003_moisture_content_odc)/r003_b88;
  r003_cdej_moisture_content = 622/(r003_b15/Math.exp(12.03-4025/(r003_b96+235))/10/100-1) < r003_cdej_pre_cooler2 ? 622/(r003_b15/Math.exp(12.03-4025/(r003_b96+235))/10/100-1) : r003_cdej_pre_cooler2;

  r003_b120 = (r003_cdej_return_air_direct*b132+(r003_b90-r003_b105)*r003_b91+r003_cdej_ambient_air*r003_b13)/r003_b88;
  r003_b121 = (r003_cdej_return_air_direct*r003_start_corresponding_to+(r003_b90-r003_b105)*r003_cdej_corresponding+r003_cdej_ambient_air*r003_moisture_content_odc)/r003_b88;
  r003_b124 = r003_b120;
  r003_b125 = 622/(r003_b15/Math.exp(12.03-4025/(r003_b124+235))/10/100-1) < r003_b121 ? 622/(r003_b15/Math.exp(12.03-4025/(r003_b124+235))/10/100-1) : r003_b121;
  r003_b96 = r003_cdej_pre_cooler1
  r003_b99 = r003_b96

  r003_b_heat_load = ((r003_b_dry_air_temperature-r003_b7)*(r003_b88-r003_b102)+(r003_b91-r003_b7)*r003_b105+(r003_b13-r003_b7)*r003_b106)*1.02/3000;

  if ($("#r003_si_mode").is(":checked")){


    $('#cdej-corresponding-to').val(r003_cdej_corresponding.toFixed(2));
    $('#cdej-ambient-air').val(r003_cdej_ambient_air.toFixed(2));
    $('#cdej-before-pre-cooler1').val(r003_cdej_pre_cooler1.toFixed(2)).trigger('change', ['false']);
    $('#cdej-before-pre-cooler2').val(r003_cdej_pre_cooler2.toFixed(2)).trigger('change', ['false']);
    $('#cdej-pre-cooling-before').val(r003_b96.toFixed(2)).trigger('change', ['false']);
    $('#cdej-temperature').val(r003_b99.toFixed(2)).trigger('change', ['false']);
    $('#cdej-moisture-content').val(r003_cdej_moisture_content.toFixed(2)).trigger('change', ['false']);

    $('#j_before_pre_cooler_degree_start').val(r003_b120.toFixed(2)).trigger('change', ['false']);
    $('#j_before_pre_cooler_rate_start').val(r003_b121.toFixed(2)).trigger('change', ['false']);
    $('#inlet_temperature_start').val(r003_b120.toFixed(2)).trigger('change', ['false']);
    $('#inlet_moisture_content_start').val(r003_b125.toFixed(2)).trigger('change', ['false']);

    $('#b-heat-load').val(r003_b_heat_load.toFixed(2));
  } else {

    $('#cdej-corresponding-to').val((r003_cdej_corresponding*7).toFixed(2));
    $('#cdej-ambient-air').val((r003_cdej_ambient_air/1.699).toFixed(2));
    $('#cdej-before-pre-cooler1').val((r003_cdej_pre_cooler1*1.8+32).toFixed(2)).trigger('change', ['false']);
    $('#cdej-before-pre-cooler2').val((r003_cdej_pre_cooler2*7).toFixed(2)).trigger('change', ['false']);
    $('#cdej-pre-cooling-before').val((r003_b96*1.8+32).toFixed(2)).trigger('change', ['false']);
    $('#cdej-temperature').val((r003_b99*1.8+32).toFixed(2)).trigger('change', ['false']);
    $('#cdej-moisture-content').val((r003_cdej_moisture_content*7).toFixed(2)).trigger('change', ['false']);

    $('#j_before_pre_cooler_degree_start').val((r003_b120*1.8+32).toFixed(2)).trigger('change', ['false']);
    $('#j_before_pre_cooler_rate_start').val((r003_b121*7).toFixed(2)).trigger('change', ['false']);
    $('#inlet_temperature_start').val((r003_b124*1.8+32).toFixed(2)).trigger('change', ['false']);
    $('#inlet_moisture_content_start').val((r003_b125*7).toFixed(2)).trigger('change', ['false']);

    $('#b-heat-load').val((r003_b_heat_load*1000/0.29307107).toFixed(2));
  }
}

$(document).ready(function() {
  calculation_cdej();
});
