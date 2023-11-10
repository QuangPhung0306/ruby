$(document).ready(function() {
  FLOW_RATE_TYPES = ['ac_supply_air_sa', 'ac_outside_air_oa', 'r_flow_rate', 'f_flow_rate', 'm_flow_rate',
    'a_flow_rate', 'n_flow_rate', 'g_flow_rate', 'h_flow_rate', 'p_flow_rate', 'j_flow_rate', 'c_flow_rate',
    'k_flow_rate', 'l_flow_rate', 'd_flow_rate', 'e_flow_rate', 's_flow_rate']
  TEMPERATURE_TYPES = ['ac_water_temperature_in', 'ac_water_temperature_out', 'r_temperature', 'f_temperature',
    'm_temperature', 'a_temperature', 'n_temperature', 'g_temperature', 'h_temperature', 'p_temperature',
    'j_temperature', 'c_temperature', 'k_temperature', 'l_temperature', 'd_temperature', 'e_temperature', 'hot_water_in', 'hot_water_out', 'textbox2']
  ABSOLUTE_HUMIDITY_TYPES = ['r_absolute_humidity', 'f_absolute_humidity', 'm_absolute_humidity',
    'a_absolute_humidity', 'n_absolute_humidity', 'g_absolute_humidity', 'h_absolute_humidity',
    'p_absolute_humidity', 'j_absolute_humidity', 'c_absolute_humidity', 'k_absolute_humidity',
    'l_absolute_humidity', 'd_absolute_humidity', 'e_absolute_humidity', 's_absolute_humidity']
  COOLER_TYPES = ['n_cathode_capacity', 'g_cathode_capacity', 'j_cathode_capacity',
    'l_cathode_capacity', 'e_anode_capacity', 'e_cathode_capacity', 'total_cooling_power', 'total_heater_power',
    'correspondes_to', 'temp_difference_SA_and_RA', 'g_anode_capacity', 'textbox50']
  HEATER_POWER_TYPES = ['n_cathode_flow_rate', 'j_cathode_flow_rate', 'room_capacity', 'g_cathode_flow_rate']
  WATER_FLOW_TYPES = ['total_cooling_water_flow', 'total_hot_water_flow']

  if ($('#air_mixture_calculation_mode').val() == 'false') {
    $.each(FLOW_RATE_TYPES, function(index, field){
      ip_flow_rate = valueToPreviewAndPrint($(`#${field}`).attr('value'), 'flow_rate');
      $(`#${field}`).val(ip_flow_rate);
      $(`#${field}_unit`).text('CFM');
    });

    $.each(TEMPERATURE_TYPES, function(index, field){
      if (field == 'regen_air_temperature') {
        ip_temperature = valueToPreviewAndPrint($(`#${field}`).text(), 'temperature');
        $(`#${field}`).text(ip_temperature);
      } else {
        ip_temperature = valueToPreviewAndPrint($(`#${field}`).attr('value'), 'temperature');
        $(`#${field}`).val(ip_temperature);
      }
      $(`#${field}_unit`).text('FDB');
    });

    $('#s_temperature_unit').text('FDB');

    $.each(ABSOLUTE_HUMIDITY_TYPES, function(index, field){
      ip_absolute_humidity = valueToPreviewAndPrint($(`#${field}`).attr('value'), 'absolute_humidity');
      $(`#${field}`).val(ip_absolute_humidity);
      $(`#${field}_unit`).text('gr/lb');
    });

    $.each(COOLER_TYPES, function(index, field){
      if (field == 'heater_power') {
        ip_cooler = valueToPreviewAndPrint($(`#${field}`).text(), 'cooler');
        $(`#${field}`).text(ip_cooler);
      } else {
        ip_cooler = valueToPreviewAndPrint($(`#${field}`).attr('value'), 'cooler');
        $(`#${field}`).val(ip_cooler);
      }
      $(`#${field}_unit`).text('BTU');
    });

    $.each(HEATER_POWER_TYPES, function(index, field){
      ip_heater_power = valueToPreviewAndPrint($(`#${field}`).attr('value'), 'heater_power');
      $(`#${field}`).val(ip_heater_power);
      $(`#${field}_unit`).text('lb/h');
    });

    $.each(WATER_FLOW_TYPES, function(index, field){
      ip_water_flow = valueToPreviewAndPrint($(`#${field}`).attr('value'), 'water_flow');
      $(`#${field}`).val(ip_water_flow);
      $(`#${field}_unit`).text('CFM');
    });
  }

  $('#show_preview_and_print').find('.inp_table_gr').each(function() {
    var real_value = $(this).val();
    if ($(this).hasClass('not_given')) {
      $(this).val('Not given');
    } else {
      $(this).val(toFixedValue(real_value));
    }
  });

  $('#heater_power').text(toFixedValue($('#heater_power').text()));
});

function toFixedValue(value) {
  if ($.isNumeric(value)) {
    var fix_two_precision =  parseFloat(value).toFixed(2);
    var fix_one_precision = parseFloat(value).toFixed(1);
    var round_value = Math.round(parseFloat(value));

    if ((round_value - fix_one_precision == 0) && (round_value - fix_two_precision == 0)) {
      return round_value;
    } else if (fix_two_precision - fix_one_precision == 0) {
      return fix_one_precision;
    } else {
      return fix_two_precision;
    }
  } else {
    return "N/A"
  }
}

function valueToPreviewAndPrint(infinitive_value, cal_mode) {
  if (cal_mode == 'flow_rate') {
    return parseFloat(infinitive_value) / 1.699;    
  } else if (cal_mode == 'temperature') {
    return parseFloat(infinitive_value) * 1.8 + 32;
  } else if (cal_mode == 'absolute_humidity') {
    return parseFloat(infinitive_value * 7);
  } else if (cal_mode == 'cooler') {
    return parseFloat(infinitive_value) * 1000 / 0.29307107;    
  } else if (cal_mode == 'heater_power') {
    return parseFloat(infinitive_value) * 2.204623;    
  } else if (cal_mode == 'water_flow') {
    return parseFloat(infinitive_value) * 2.119;
  }
}
