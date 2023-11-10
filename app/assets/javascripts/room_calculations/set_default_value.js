$('.calculation_data_inputs').ready(function () {
  $('#vii-tightness-of-building').val(3);
  $('#vii-surroundings').val(2);

  $('#r003_result_process_airflow').text($('[name=process_airflow]').val());
  $('#r003_result_return_air_direct').text($('[name=return_air_direct]').val());
  $('#r003_result_pre_cooled_air').text($('[name=pre_cooled_air]').val());
  $('#r003_result_pre_cooling_ambient').text($('[name=pre_cooling_ambient_air]').val());
  $('#r003_result_corresponding_to').text($('[name=corresponding_to]').val());
  $('#r003_result_ambient_air').text($('[name=ambient_air_direct]').val());
  $('#r003_result_before_pre_cooler1').text($('[name=j_before_pre_cooler_degree]').val());
  $('#r003_result_before_pre_cooler2').text($('[name=j_before_pre_cooler_rate]').val());
  $('#r003_result_pre_cooling_before').text($('[name=j_to_a_pre_cooling]').val());
  $('#r003_result_temperature').text($('[name=inlet_temperature]').val());
  $('#r003_result_moisture_content').text($('[name=inlet_moisture_content]').val());
  $('#r003_result_pre_cooling').text($('[name=air_direct_from_pre_cooling]').val());
  $('#r003_result_ambient').text($('[name=air_direct_from_ambient]').val());
  $('#r003_result_leakage').text($('[name=leakage]').val());

  $('#r003_result_total_dry_air_flow').text($('[name=total_dry_air_flow]').val());

  $(document.querySelectorAll(".dropdown-unit")[0]).click();

  $('#final-temperature').text(20);
  $('#final-relative-humidity').text(50);
  $('#final-atmospheric-pressure').text(1014);
  $('#start-atmospheric-pressure').text(1014);
  $('#final-corresponding-to').text(r003_final_corresponding_to.toFixed(2));
  $('#start-temperature').text(25);
  $('#start-relative-humidity').text(60);
  $('#start-corresponding-to').text(r003_start_corresponding_to.toFixed(2));
})
