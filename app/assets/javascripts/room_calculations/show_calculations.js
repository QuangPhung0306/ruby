function show_calculations(){
  $('.category_and_unit').on('click', '.dropdown-unit', function(){
    room_calculation_unit_name = $(this).attr('data-name');
    $('#unit-name').text(room_calculation_unit_name);
  });

  $('.category_and_unit').on('change', '#number_of_units', function() {
    quantity = $('#number_of_units').val();
    $('#quantity').text(quantity);
  });

  $('.calculation_data_inputs').on('change', '#drc-atmospheric-pressure, #drc-temperature, #drc-relative-humidity', function() {
    atmospheric_pressure = convert_comma_to_dot($('#drc-atmospheric-pressure').val());
    temperature = convert_comma_to_dot($('#drc-temperature').val());
    relative_humidity = convert_comma_to_dot($('#drc-relative-humidity').val());

    r003_final_corresponding_to = 622/(atmospheric_pressure/Math.exp(12.03 - 4025/(temperature + 235))/10/relative_humidity - 1)

    $('#final-temperature').text(temperature);
    $('#final-relative-humidity').text(relative_humidity);
    $('#final-atmospheric-pressure').text(atmospheric_pressure);
    $('#start-atmospheric-pressure').text(atmospheric_pressure);
    $('#final-corresponding-to').text(r003_final_corresponding_to.toFixed(2));
  });

  $('.calculation_data_inputs').on('change', '#drc-atmospheric-pressure, #odc-temperature, #odc-relative-humidity, #src-temperature, #src-relative-humidity', function() {
    atmospheric_pressure = convert_comma_to_dot($('#drc-atmospheric-pressure').val());
    temperature = $('#check-door').val() == 1 ? convert_comma_to_dot($('#odc-temperature').val()) : convert_comma_to_dot($('#src-temperature').val());
    relative_humidity = $('#check-door').val() == 1 ? convert_comma_to_dot($('#odc-relative-humidity').val()) : convert_comma_to_dot($('#src-relative-humidity').val());
    r003_start_corresponding_to = $('#check-door').val() == 1 ? r003_moisture_content_odc : r003_moisture_content_src
    // r003_start_corresponding_to = 622/(atmospheric_pressure/Math.exp(12.03 - 4025/(temperature + 235))/10/relative_humidity - 1)

    $('#start-temperature').text(temperature);
    $('#start_temperature').val(temperature).trigger('change');
    $('#start-relative-humidity').text(relative_humidity);
    $('#starting_relative_humidity').val(relative_humidity);
    $('#starting_corresponding_to').val(r003_start_corresponding_to.toFixed(2)).trigger('change');
    if ($("#r003_si_mode").is(":checked")) {
      $('#start-corresponding-to').text(r003_start_corresponding_to.toFixed(2));
    } else {
      $('#start-corresponding-to').text((r003_start_corresponding_to*7).toFixed(2));
    }
  });

  $('.calculation_data_inputs').on('change', '#check-door', function() {
    atmospheric_pressure = convert_comma_to_dot($('#drc-atmospheric-pressure').val());
    temperature = $('#check-door').val() == 1 ? convert_comma_to_dot($('#odc-temperature').val()) : convert_comma_to_dot($('#src-temperature').val());
    relative_humidity = $('#check-door').val() == 1 ? convert_comma_to_dot($('#odc-relative-humidity').val()) : convert_comma_to_dot($('#src-relative-humidity').val());
    r003_start_corresponding_to = $('#check-door').val() == 1 ? r003_moisture_content_odc : r003_moisture_content_src
    // r003_start_corresponding_to = 622/(atmospheric_pressure/Math.exp(12.03 - 4025/(temperature + 235))/10/relative_humidity - 1)

    $('#start-temperature').text(temperature);
    $('#start_temperature').val(temperature);
    $('#start-relative-humidity').text(relative_humidity);
    $('#starting_relative_humidity').val(relative_humidity);
    $('#starting_corresponding_to').val(r003_start_corresponding_to.toFixed(2));
    if ($("#r003_si_mode").is(":checked")) {
      $('#start-corresponding-to').text(r003_start_corresponding_to.toFixed(2));
    } else {
      $('#start-corresponding-to').text((r003_start_corresponding_to*7).toFixed(2));
    }
  });

  $('.calculation_data_inputs').on('change', '#b-total-dry-air-flow, #cdej-process-airflow, #cdej-return-air-direct, #cdej-pre-cooled-air, #cdej-pre-cooling-ambient, #cdej-corresponding-to, #cdej-ambient-air, #cdej-before-pre-cooler1, #cdej-before-pre-cooler2, #cdej-pre-cooling-before, #cdej-temperature, #cdej-moisture-content, #hgf-pre-cooling, #hgf-ambient, #hgf-leakage', function() {
    $('#r003_result_process_airflow').text(convert_comma_to_dot($('[name=process_airflow]').val()));
    $('#r003_result_return_air_direct').text(convert_comma_to_dot($('[name=return_air_direct]').val()));
    $('#r003_result_pre_cooled_air').text(convert_comma_to_dot($('[name=pre_cooled_air]').val()));
    $('#r003_result_pre_cooling_ambient').text(convert_comma_to_dot($('[name=pre_cooling_ambient_air]').val()));
    $('#r003_result_corresponding_to').text(convert_comma_to_dot($('[name=corresponding_to]').val()));
    $('#r003_result_ambient_air').text(convert_comma_to_dot($('[name=ambient_air_direct]').val()));
    $('#r003_result_before_pre_cooler1').text(convert_comma_to_dot($('[name=j_before_pre_cooler_degree]').val()));
    $('#r003_result_before_pre_cooler2').text(convert_comma_to_dot($('[name=j_before_pre_cooler_rate]').val()));
    $('#r003_result_pre_cooling_before').text(convert_comma_to_dot($('[name=j_to_a_pre_cooling]').val()));
    $('#r003_result_temperature').text(convert_comma_to_dot($('[name=inlet_temperature]').val()));
    $('#r003_result_moisture_content').text(convert_comma_to_dot($('[name=inlet_moisture_content]').val()));
    $('#r003_result_pre_cooling').text(convert_comma_to_dot($('[name=air_direct_from_pre_cooling]').val()));
    $('#r003_result_ambient').text(convert_comma_to_dot($('[name=air_direct_from_ambient]').val()));
    $('#r003_result_leakage').text(convert_comma_to_dot($('[name=leakage]').val()));

    $('#r003_result_total_dry_air_flow').text(convert_comma_to_dot($('[name=total_dry_air_flow]').val()));
  });
}

$(document).ready(function() {
  show_calculations();
});
