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

  READ_ONLY_FLOW_RATE_TYPES = ['a_flow_rate', 'f_flow_rate', 'm_flow_rate', 'r_flow_rate', 's_flow_rate', 'e_flow_rate']
  READ_ONLY_TEMPERATURE_TYPES = ['a_temperature', 'f_temperature', 'm_temperature', 'r_temperature', 's_temperature', 'e_temperature']
  READ_ONLY_ABSOLUTE_HUMIDITY_TYPES = ['a_absolute_humidity', 'f_absolute_humidity', 'm_absolute_humidity', 'r_absolute_humidity', 's_absolute_humidity', 'e_absolute_humidity']

  $('#air_mixture_ip').change(function() {
    window.calculation_mode = false;
    $('.new-air-mixtures-project').validate().destroy();
    new_air_mixture_project_ip();
    resetChoosenUnit();
    convertFromSiToIp();
  });

  $('#air_mixture_si').change(function() {
    window.calculation_mode = true;
    $('.new-air-mixtures-project').validate().destroy();
    new_air_mixture_project_si();
    resetChoosenUnit();
    convertFromIpToSi();
  });

  function resetChoosenUnit() {
    var unit_with_mode = calculation_mode ? "m3/h" : "CFM";

    for(var i = 0; i< $('.dropdown-unit').length; i++) {
      $('.dropdown-unit').eq(i).attr('data-dry-air', valueFlowRateToSetElement(parseFloat($('.dropdown-unit').eq(i).data('dry-air'))));
      $('.dropdown-unit').eq(i).attr('data-wet-air', valueFlowRateToSetElement(parseFloat($('.dropdown-unit').eq(i).data('wet-air'))));
      $('.dropdown-unit').eq(i).attr('data-capacity', valueHeaterPowerToSetElement(parseFloat($('.dropdown-unit').eq(i).data('capacity'))));
      $('.dropdown-unit').eq(i).find('.color_red').html(toFixedValue(valueFlowRateToSetElement(parseFloat($('.dropdown-unit').eq(i).data('dry-air')))) + '&nbsp;' + `${unit_with_mode}`);
    }

    if ($.isNumeric(window.selected_unit_id)) {
      window.selected_model = $('#item-units').find('[data-id=' + selected_unit_id + ']');
      window.m_unit_dry_air =  valueFlowRateToSetGlobal(parseFloat(selected_model.attr('data-dry-air')));
      window.m_unit_wet_air = valueFlowRateToSetGlobal(parseFloat(selected_model.attr('data-wet-air')));
      window.m_unit_capacity = valueHeaterPowerToSetGlobal(parseFloat(selected_model.attr('data-capacity')));
      window.m_special_wet_air = parseFloat((special_model_name.includes(selected_model.attr('data-model-name')) ? 0 : m_unit_wet_air));
      window.m_special_dry_air = parseFloat((special_model_name.includes(selected_model.attr('data-model-name')) ? (m_unit_dry_air + m_unit_wet_air) : m_unit_dry_air));

      var m_unit_name = selected_model.data('model-name');
      $('#dropdown_unit_box').find('.btn_ct_sl').html(`${m_unit_name}, ${toFixedValue(valueFlowRateToSetElement(m_unit_dry_air))} ${unit_with_mode}`);
      $('#dropdown_unit_box').find('.btn_ct_sl').addClass('color_green');
    }
  }

  function convertFromIpToSi() {
    $.LoadingOverlay("show");

    let dataResult = new FormData();

    var air_mixture_ids = [];
    $('#data-rows tr').each(function () {
      air_mixture_ids.push($(this).attr("data-air-mixture-input-id"));
    });

    var results_checked = [];
    $('.choosen-result-cb:checked').each(function() {
      results_checked.push($(this).val());
    });

    data_result = {air_mixture_ids: air_mixture_ids, calculation_mode: "si", results_checked: results_checked};
    dataResult.append('results', JSON.stringify(data_result));

    Rails.ajax({
      url: '/unit_selection/convert_air_mixture_results',
      type: 'POST',
      data: dataResult,
      dataType: 'script',
      success: function(data) {
        $.LoadingOverlay("hide");
      },
      error: function(data) {
        $.LoadingOverlay("hide");
      }
    });
    
    setValueInputSiMode();
  }

  function convertFromSiToIp() {
    $.LoadingOverlay("show");

    let dataResult = new FormData();

    var air_mixture_ids = [];
    $('#data-rows tr').each(function () {
      air_mixture_ids.push($(this).attr("data-air-mixture-input-id"));
    });

    var results_checked = [];
    $('.choosen-result-cb:checked').each(function() {
      results_checked.push($(this).val());
    });

    data_result = {air_mixture_ids: air_mixture_ids, calculation_mode: "ip", results_checked: results_checked};
    dataResult.append('results', JSON.stringify(data_result));

    Rails.ajax({
      url: '/unit_selection/convert_air_mixture_results',
      type: 'POST',
      data: dataResult,
      dataType: 'script',
      success: function(data) {
        $.LoadingOverlay("hide");
      },
      error: function(data) {
        $.LoadingOverlay("hide");
      }
    });

    setValueInputIpMode();
  }
});

function setValueInputSiMode() {
  $('#supply_air_sa').val(toFixedValue(valueFlowRateToSetElement(window['ac_supply_air_sa'])));

  $.each(FLOW_RATE_TYPES, function(index, field){
    si_flow_rate = valueFlowRateToSetElement(window[`${field}`]);
    if (field == 'ac_outside_air_oa') {
      changeModeSetInputShowElement(field, si_flow_rate);
    } else {
      changeModeSetValueSectionElement(`${field}`, si_flow_rate);
    }
  });

  $.each(TEMPERATURE_TYPES, function(index, field){
    si_temperature = valueTemperatureToSetElement(window[`${field}`]);
    if (field == 'j_temperature' || field == 'e_temperature') {
      changeModeSetInputDisplayElement(field, si_temperature);
    } else {
      changeModeSetValueSectionElement(`${field}`, si_temperature);
    }
  });

  $.each(ABSOLUTE_HUMIDITY_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueAbsoluteHumidityToSetElement(window[`${field}`]));
  });

  $.each(COOLER_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueCoolerToSetElement(window[`${field}`]));
  });

  $.each(HEATER_POWER_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueHeaterPowerToSetElement(window[`${field}`]));
  });

  $.each(WATER_FLOW_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueWaterFlowToSetElement(window[`${field}`]));
  });

  $.each(READ_ONLY_FLOW_RATE_TYPES, function(index, field) {
    $(`#readonly_${field}`).val(toFixedValue($(`#${field}`).val()));
  });

  $.each(READ_ONLY_TEMPERATURE_TYPES, function(index, field) {
    $(`#readonly_${field}`).val(toFixedValue($(`#${field}`).val()));
  });

  $.each(READ_ONLY_ABSOLUTE_HUMIDITY_TYPES, function(index, field) {
    $(`#readonly_${field}`).val(toFixedValue($(`#${field}`).val()));
  });

  $('#readonly_s_temperature').val('Not given');
  
  if (calculation_mode == true) {
    setUnitSiMode();
  }
}

function setUnitSiMode() {
  $.each(FLOW_RATE_TYPES, function(index, field){
    $(`#${field}_unit`).text('m3/h');
  });

  $.each(TEMPERATURE_TYPES, function(index, field){
    $(`#${field}_unit`).html('<sup>o</sup>C');
  });

  $('#s_temperature_unit').html('<sup>o</sup>C');

  $.each(ABSOLUTE_HUMIDITY_TYPES, function(index, field){
    $(`#${field}_unit`).text('g/kg');
  });

  $.each(COOLER_TYPES, function(index, field){
    if (['g_cathode_capacity', 'n_cathode_capacity', 'j_cathode_capacity', 'l_cathode_capacity', 'e_anode_capacity'].includes(field)) {
      $(`#${field}_unit`).text('kWR');
    } else if (field == "textbox50") {
      $(`#${field}_unit`).text('kW/h');
    } else {
      $(`#${field}_unit`).text('kW');
    }
  });

  $.each(HEATER_POWER_TYPES, function(index, field){
    $(`#${field}_unit`).text('kg/h');
  });

  $.each(WATER_FLOW_TYPES, function(index, field){
    $(`#${field}_unit`).text('l/s');
  });


  $.each(READ_ONLY_FLOW_RATE_TYPES, function(index, field) {
    $(`#readonly_${field}_unit`).text('m3/h');
  });

  $.each(READ_ONLY_TEMPERATURE_TYPES, function(index, field) {
    $(`#readonly_${field}_unit`).html('<sup>o</sup>C');
  });

  $.each(READ_ONLY_ABSOLUTE_HUMIDITY_TYPES, function(index, field) {
    $(`#readonly_${field}_unit`).text('g/kg');
  });  
}

function setValueInputIpMode() {
  $('#supply_air_sa').val(toFixedValue(valueFlowRateToSetElement(window['ac_supply_air_sa'])));

  $.each(FLOW_RATE_TYPES, function(index, field){
    ip_flow_rate = valueFlowRateToSetElement(window[`${field}`]);
    if (field == 'ac_outside_air_oa') {
      changeModeSetInputShowElement(field, ip_flow_rate);
    } else {
      changeModeSetValueSectionElement(`${field}`, ip_flow_rate);
    }
  });

  $.each(TEMPERATURE_TYPES, function(index, field){
    ip_temperature = valueTemperatureToSetElement(window[`${field}`]);
    if (field == 'j_temperature' || field == 'e_temperature') {
      changeModeSetInputDisplayElement(field, ip_temperature);
    } else {
      changeModeSetValueSectionElement(`${field}`, ip_temperature);
    }
  });

  $.each(ABSOLUTE_HUMIDITY_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueAbsoluteHumidityToSetElement(window[`${field}`]));
  });

  $.each(COOLER_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueCoolerToSetElement(window[`${field}`]));
  });

  $.each(HEATER_POWER_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueHeaterPowerToSetElement(window[`${field}`]));
  });

  $.each(WATER_FLOW_TYPES, function(index, field){
    changeModeSetValueSectionElement(`${field}`, valueWaterFlowToSetElement(window[`${field}`]));
  });

  $.each(READ_ONLY_FLOW_RATE_TYPES, function(index, field) {
    $(`#readonly_${field}`).val(toFixedValue($(`#${field}`).val()));
  });

  $.each(READ_ONLY_TEMPERATURE_TYPES, function(index, field) {
    $(`#readonly_${field}`).val(toFixedValue($(`#${field}`).val()));
  });

  $.each(READ_ONLY_ABSOLUTE_HUMIDITY_TYPES, function(index, field) {
    $(`#readonly_${field}`).val(toFixedValue($(`#${field}`).val()));
  });

  $('#readonly_s_temperature').val('Not given');
  
  if (calculation_mode == false) {
    setUnitIpMode();
  }
}

function setUnitIpMode() {
  $.each(FLOW_RATE_TYPES, function(index, field){
    $(`#${field}_unit`).text('CFM');
  });

  $.each(TEMPERATURE_TYPES, function(index, field){
    $(`#${field}_unit`).text('FDB');
  });

  $('#s_temperature_unit').text('FDB');

  $.each(ABSOLUTE_HUMIDITY_TYPES, function(index, field){
    $(`#${field}_unit`).text('gr/lb');
  });

  $.each(COOLER_TYPES, function(index, field){
    if (field == "textbox50") {
      $(`#${field}_unit`).text('BTU/h');
    } else {
      $(`#${field}_unit`).text('BTU');
    }
  });

  $.each(HEATER_POWER_TYPES, function(index, field){
    $(`#${field}_unit`).text('lb/h');
  });

  $.each(WATER_FLOW_TYPES, function(index, field){
    $(`#${field}_unit`).text('CFM');
  });

  $.each(READ_ONLY_FLOW_RATE_TYPES, function(index, field) {
    $(`#readonly_${field}_unit`).text('CFM');
  });

  $.each(READ_ONLY_TEMPERATURE_TYPES, function(index, field) {
    $(`#readonly_${field}_unit`).text('FDB');
  });

  $.each(READ_ONLY_ABSOLUTE_HUMIDITY_TYPES, function(index, field) {
    $(`#readonly_${field}_unit`).text('gr/lb');
  });  
}

function changeModeSetValueSectionElement(element, value) {
  if (element != "s_temperature") {
    if ($.isNumeric(value)) {
      var to_fixed_value = toFixedValue(value);
      $(`#${element}_display`).text(to_fixed_value);
      $(`#${element}`).val(to_fixed_value);
    } else if (value == "") {
      $(`#${element}_display`).text("");
      $(`#${element}`).val("");
    } else {
      $(`#${element}_display`).text("N/A");
      $(`#${element}`).val("N/A");
    }
  }
}

function changeModeSetInputDisplayElement(element, value) {
  if ($.isNumeric(value)) {
    var to_fixed_value = toFixedValue(value);
    $(`#${element}_display`).val(to_fixed_value);
    $(`#${element}`).val(to_fixed_value);
  } else if (value == "") {
    $(`#${element}_display`).val("");
    $(`#${element}`).val("");
  } else {
    $(`#${element}_display`).val("N/A");
    $(`#${element}`).val("N/A");
  }
}

function changeTextbox2OrTextbox50(element, value) {
  if ($.isNumeric(value)) {
    var to_fixed_value = toFixedValue(value);
    $(`#${element}`).val(to_fixed_value);
    if ($("#textbox2").valid()){
      $("#textbox2").removeAttr("title");
      $("#textbox2").css("border-color", "#707070");
      $("#textbox2").removeClass("text-danger");
    }
    if ($("#textbox50").valid()){
      $("#textbox50").removeAttr("title");
      $("#textbox50").css("border-color", "#707070");
      $("#textbox50").removeClass("text-danger");
    }
  } else if (value == "") {
    $(`#${element}`).val("");
  } else {
    $(`#${element}`).val("N/A");
  }
}

function changeModeSetInputShowElement(element, value) {
  if ($.isNumeric(value)) {
    var to_fixed_value = toFixedValue(value);
    $(`#${element}_show`).val(to_fixed_value);
    $(`#${element}`).val(to_fixed_value);
  } else if (value == "") {
    $(`#${element}_show`).val("");
    $(`#${element}`).val("");
  } else {
    $(`#${element}_show`).val("N/A");
    $(`#${element}`).val("N/A");
  }
}
