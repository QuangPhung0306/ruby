function calculation_preview(){
  $('#link_to_preview').click(function(){
    unit_name = $('#unit-name').text();
    category_name = $('.category').text().replace(/(\r\n|\n|\r| )/gm, "");
    quantity = convert_comma_to_dot($('#quantity').text());
    cdej_process_airflow = convert_comma_to_dot($('#cdej-process-airflow').val());
    return_air_direct = convert_comma_to_dot($('#cdej-return-air-direct').val());
    pre_cooled_air = convert_comma_to_dot($('#cdej-pre-cooled-air').val());
    pre_cooling_ambient_air = convert_comma_to_dot($('#cdej-pre-cooling-ambient').val());
    corresponding_to = convert_comma_to_dot($('#cdej-corresponding-to').val());
    ambient_air_direct = convert_comma_to_dot($('#cdej-ambient-air').val());
    j_before_pre_cooler_degree = convert_comma_to_dot($('#cdej-before-pre-cooler1').val());
    j_before_pre_cooler_rate = convert_comma_to_dot($('#cdej-before-pre-cooler2').val());
    j_to_a_pre_cooling = convert_comma_to_dot($('#cdej-pre-cooling-before').val());
    inlet_temperature = convert_comma_to_dot($('#cdej-temperature').val());
    inlet_moisture_content = convert_comma_to_dot($('#cdej-moisture-content').val());
    air_direct_from_pre_cooling = convert_comma_to_dot($('#hgf-pre-cooling').val());
    air_direct_from_ambient = convert_comma_to_dot($('#hgf-ambient').val());
    leakage = convert_comma_to_dot($('#hgf-leakage').val());

    total_dry_air_flow = convert_comma_to_dot($('#b-total-dry-air-flow').val());
    dry_air_needed_moisture_content = convert_comma_to_dot($('#b-needed-moisture-content').val());
    dry_air_temperature = convert_comma_to_dot($('#b-dry-air-temperature').val());
    heat_load = convert_comma_to_dot($('#b-heat-load').val());

    start_temperature = convert_comma_to_dot($('#start-temperature').text());
    start_relative_humidity = convert_comma_to_dot($('#start-relative-humidity').text());
    start_atmospheric_pressure = convert_comma_to_dot($('#start-atmospheric-pressure').text());
    start_corresponding = convert_comma_to_dot($('#start-corresponding-to').text());
    start_capacity = convert_comma_to_dot($('#start-capacity').text());
    final_temperature = convert_comma_to_dot($('#final-temperature').text());
    final_relative_humidity = convert_comma_to_dot($('#final-relative-humidity').text());
    final_atmospheric_pressure = convert_comma_to_dot($('#final-atmospheric-pressure').text());
    final_corresponding = convert_comma_to_dot($('#final-corresponding-to').text());
    final_capacity = convert_comma_to_dot($('#final-capacity').text());
    project_name = $('#project_name').val();
    date_of_project = $("input[name=date_of_project]").val();

    result_xp2 = convert_comma_to_dot($("#result_xp2").val());
    result_tp2 = convert_comma_to_dot($("#result_tp2").val());
    result_mr = convert_comma_to_dot($("#result_mr").val());
    result_xp2_text = $("#xp2_text").text();

    mode = ($("#r003_si_mode").is(":checked")) ? "si" : "ip";

    $('#link_to_preview').attr('href', $('#link_to_preview').attr('href').replace(/\?.*/, "") + "?cdej_process_airflow="+cdej_process_airflow + "&return_air_direct="+return_air_direct
      + "&pre_cooled_air="+pre_cooled_air + "&pre_cooling_ambient_air="+pre_cooling_ambient_air + "&corresponding_to="+corresponding_to
      + "&ambient_air_direct="+ambient_air_direct + "&j_before_pre_cooler_degree="+j_before_pre_cooler_degree + "&j_before_pre_cooler_rate="+j_before_pre_cooler_rate
      + "&j_to_a_pre_cooling="+j_to_a_pre_cooling + "&inlet_temperature="+inlet_temperature + "&inlet_moisture_content="+inlet_moisture_content
      + "&air_direct_from_pre_cooling="+air_direct_from_pre_cooling + "&air_direct_from_ambient="+air_direct_from_ambient + "&leakage="+leakage
      + "&total_dry_air_flow="+total_dry_air_flow + "&dry_air_needed_moisture_content="+dry_air_needed_moisture_content + "&dry_air_temperature="+dry_air_temperature
      + "&heat_load="+heat_load + "&start_temperature="+start_temperature + "&start_relative_humidity="+start_relative_humidity
      + "&start_atmospheric_pressure="+start_atmospheric_pressure + "&start_corresponding="+start_corresponding + "&start_capacity="+start_capacity
      + "&final_temperature="+final_temperature + "&final_relative_humidity="+final_relative_humidity + "&final_atmospheric_pressure="+final_atmospheric_pressure
      + "&final_corresponding="+final_corresponding + "&final_capacity="+final_capacity + "&unit_name="+unit_name + "&category_name="+category_name + "&quantity="+quantity
      + "&project_name="+project_name + "&date_of_project="+date_of_project + "&result_xp2="+result_xp2 + "&result_tp2="+result_tp2 + "&result_mr="+result_mr + "&result_xp2_text="+result_xp2_text
      + "&mode="+mode);
  })
}

$(document).ready(function() {
  calculation_preview();
});
