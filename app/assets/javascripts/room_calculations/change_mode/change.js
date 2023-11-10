$(document).ready(function() {
  $(".general_information_inputs").on("change", "#r003_ip_mode", (function() {
    $("input[name=drc_temperature]").val((r003_b7*1.8+32).toFixed(2));
    $("input[name=drc_relative_humidity]").val((r003_b8).toFixed(2));
    $("input[name=drc_atmospheric_pressure]").val((r003_b9).toFixed(2));
    $("input[name=drc_moisture_content]").val((r003_moisture_content_drc*7).toFixed(2));
    $("input[name=odc_temperature]").val((r003_b13*1.8+32).toFixed(2));
    $("input[name=odc_relative_humidity]").val((r003_b14).toFixed(2));
    $("input[name=odc_atmospheric_pressure]").val((r003_b15).toFixed(2));
    $("input[name=odc_moisture_content]").val((r003_moisture_content_odc*7).toFixed(2));
    $("input[name=src_temperature]").val((r003_b19*1.8+32).toFixed(2));
    $("input[name=src_relative_humidity]").val((r003_b20).toFixed(2));
    $("input[name=src_atmospheric_pressure]").val((r003_b21).toFixed(2));
    $("input[name=src_moisture_content]").val((r003_moisture_content_src*7).toFixed(2));
    $("input[name=room_length]").val((r003_b27/0.91).toFixed(2));
    $("input[name=room_width]").val((r003_b28/0.91).toFixed(2));
    $("input[name=room_height]").val((r003_b29/0.91).toFixed(2));
    $("input[name=room_volume]").val((r003_room_volume_vii_tr/0.0283168).toFixed(2));
    $("input[name=without_lock_door_height]").val((r003_b34/0.91).toFixed(2));
    $("input[name=without_lock_door_width]").val((r003_c34/0.91).toFixed(2));
    $("input[name=air_lock_doors_height]").val((r003_b35/0.91).toFixed(2));
    $("input[name=air_lock_doors_width]").val((r003_c35/0.91).toFixed(2));
    $("input[name=air_lock_doors_length]").val((r003_d35/0.91).toFixed(2));
    $("input[name=wind_speed]").val((r003_b38/0.00508).toFixed(2));
    $("input[name=without_lock_opened_per_hour]").val((r003_b39).toFixed(2));
    $("input[name=air_lock_vestibule_passages_per_hour]").val((r003_b40).toFixed(2));
    $("input[name=tightness_of_room]").val((r003_room_tightness_vii_tr/1.699).toFixed(2));
    $("input[name=door_or_air_lock_infiltration]").val((r003_vii_infiltration_door_air_clock/1.699).toFixed(2));
    $("input[name=open_holes]").val((r003_b43/0.092903).toFixed(2));
    $("input[name=needed_airflow]").val((r003_vii_needed_airflow/1.699).toFixed(2));
    $("input[name=mechanical_ventilation]").val((r003_b45/1.699).toFixed(2));
    $("input[name=total_ventilation_from_outdoor]").val((r003_vii_total_outdoor/1.699).toFixed(2));
    $("input[name=total_ventilation_from_surrounding_rooms]").val((r003_vii_total_surrounding_rooms/1.699).toFixed(2));
    $("input[name=percentage_leakage]").val((r003_vii_percentage).toFixed(2));
    $("input[name=total_load_from_ventilation]").val((r003_vii_total_load_ventilation*2.204623).toFixed(2));

    $("input[name=number_of_people]").val(r003_b52);
    $("input[name=moisture_load_from_each]").val((r003_b53*2.204623).toFixed(2));
    $("input[name=total_load_from_people]").val((r003_pitr*2.204623).toFixed(2));

    $("input[name=pool_length]").val((r003_b57/0.91).toFixed(2));
    $("input[name=pool_width]").val((r003_b58/0.91).toFixed(2));
    $("input[name=pool_surface]").val((r003_ows_pool_surface/0.092903).toFixed(2));
    $("input[name=water_temperature]").val((r003_b60*1.8+32).toFixed(2));
    $("input[name=vaporization_coefficient]").val((r003_b61).toFixed(2));
    $("input[name=total_load_from_water_surface]").val((r003_total_water_surface*2.204623).toFixed(2));

    $("input[name=total_weight_of_products]").val((r003_b65*2.204623).toFixed(2));
    $("input[name=start_percentage_of_moisture]").val((r003_b66*100).toFixed(2));
    $("input[name=percentage_dried_per_hour]").val((r003_b67*100).toFixed(2));
    $("input[name=total_load_from_product_drying]").val((r003_pd*2.204623).toFixed(2));
    $("input[name=total_load_from_other_sources]").val((r003_other*2.204623).toFixed(2));
    $("input[name=total_moisture_load]").val((r003_tml*2.204623).toFixed(2));
    $('.txt_tml').html((r003_tml*2.204623).toFixed(2) + ' lb/h').addClass('color_red');

    $("input[name=process_airflow]").val((r003_b88/1.699).toFixed(2));
    $("input[name=return_air_direct]").val((r003_cdej_return_air_direct/1.699).toFixed(2));
    $("input[name=pre_cooled_air]").val((r003_b90/1.699).toFixed(2));
    $("input[name=pre_cooling_ambient_air]").val((r003_b91*1.8+32).toFixed(2));
    $("input[name=corresponding_to]").val((r003_cdej_corresponding*7).toFixed(2));
    $("input[name=ambient_air_direct]").val((r003_cdej_ambient_air/1.699).toFixed(2));
    $("input[name=j_before_pre_cooler_degree]").val((r003_cdej_pre_cooler1*1.8+32).toFixed(2));
    $("input[name=j_before_pre_cooler_rate]").val((r003_cdej_pre_cooler2*7).toFixed(2));
    $("input[name=j_to_a_pre_cooling]").val((r003_b96*1.8+32).toFixed(2));
    $("input[name=inlet_temperature]").val((r003_b99*1.8+32).toFixed(2));
    $("input[name=inlet_moisture_content]").val((r003_cdej_moisture_content*7).toFixed(2));
    $("input[name=total_wet_air_flow]").val((r003_b102/1.699).toFixed(2));
    $("input[name=air_direct_from_pre_cooling]").val((r003_b105/1.699).toFixed(2));
    $("input[name=air_direct_from_ambient]").val((r003_b106/1.699).toFixed(2));
    $("input[name=total_airflow_to_room]").val((r003_fgh_total_airflow/1.699).toFixed(2));
    $("input[name=air_mix_needed_moisture_content]").val((r003_hfg_needed_moisture_content*7).toFixed(2));
    $('.txt_dry_air_needed_moisture_content').html((r003_hfg_needed_moisture_content*7).toFixed(2) + ' gr/lb').addClass('color_red');
    $("input[name=leakage]").val((r003_fgh_leakage/1.699).toFixed(2));
    $("input[name=total_dry_air_flow]").val((r003_b112/1.699).toFixed(2));
    $("input[name=dry_air_needed_moisture_content]").val((r003_b_needed_moisture_content*7).toFixed(2));
    $("input[name=dry_air_temperature]").val((r003_b_dry_air_temperature*1.8+32).toFixed(2));
    $("input[name=heat_load]").val((r003_b_heat_load*1000/0.29307107).toFixed(2));

    $('#j_before_pre_cooler_degree_start').val((r003_b120*1.8+32).toFixed(2));
    $('#j_before_pre_cooler_rate_start').val((r003_b121*7).toFixed(2));
    $('#inlet_temperature_start').val((r003_b124*1.8+32).toFixed(2));
    $('#inlet_moisture_content_start').val((r003_b125*7).toFixed(2));

    $('#r003_result_process_airflow').text((r003_b88/1.699).toFixed(2));
    $('#r003_result_return_air_direct').text((r003_cdej_return_air_direct/1.699).toFixed(2));
    $('#r003_result_pre_cooled_air').text((r003_b90/1.699).toFixed(2));
    $('#r003_result_pre_cooling_ambient').text((r003_b91*1.8+32).toFixed(2));
    $('#r003_result_corresponding_to').text((r003_cdej_corresponding*7).toFixed(2));
    $('#r003_result_ambient_air').text((r003_cdej_ambient_air/1.699).toFixed(2));
    $('#r003_result_before_pre_cooler1').text((r003_cdej_pre_cooler1*1.8+32).toFixed(2));
    $('#r003_result_before_pre_cooler2').text((r003_cdej_pre_cooler2*7).toFixed(2));
    $('#r003_result_pre_cooling_before').text((r003_b96*1.8+32).toFixed(2));
    $('#r003_result_temperature').text((r003_b99*1.8+32).toFixed(2));
    $('#r003_result_moisture_content').text((r003_cdej_moisture_content*7).toFixed(2));
    $('#r003_result_pre_cooling').text((r003_b105/1.699).toFixed(2));
    $('#r003_result_ambient').text((r003_b106/1.699).toFixed(2));
    $('#r003_result_leakage').text((r003_fgh_leakage/1.699).toFixed(2));

    $('#r003_result_total_dry_air_flow').text((r003_b112/1.699).toFixed(2));

    $('#final-temperature').text((r003_b7*1.8+32).toFixed(2));
    $('#final-relative-humidity').text(r003_b8);
    $('#final-atmospheric-pressure').text(r003_b9);
    $('#final-corresponding-to').text((r003_moisture_content_drc*7).toFixed(2));
    if ($("#check-door").val() == 1) {
      $('#start-temperature').text((r003_b13*1.8+32).toFixed(2));
      $('#start_temperature').val((r003_b13*1.8+32).toFixed(2));
      $('#start-relative-humidity').text(r003_b14);
      $('#start-atmospheric-pressure').text(r003_b15);
      $('#start-corresponding-to').text((r003_moisture_content_odc*7).toFixed(2));
    } else {
      $('#start-temperature').text((r003_b19*1.8+32).toFixed(2));
      $('#start_temperature').val((r003_b19*1.8+32).toFixed(2));
      $('#start-relative-humidity').text(r003_b20);
      $('#start-atmospheric-pressure').text(r003_b21);
      $('#start-corresponding-to').text((r003_moisture_content_src*7).toFixed(2));
    }

    $.each( $(".dropdown-unit"), function( i, value ){
      capacity = $(value).data("capacity");
      new_capacity = capacity*2.204623;
      $(value).find("span.color_red").text(new_capacity.toFixed(2) + "lb/h at 68FDB/60%RH");
    });
    current_unit_id = $("#room_calculation_unit_id").val();
    current_unit = $("[data-id=" + current_unit_id + "]");
    $(".unit_button").text(current_unit.data("name") + "," + current_unit.find("span.color_red").text());

    $.each($('.measure'), function( index, value ){
      if ($(value).text().includes("oC")) {
        $(value).html("<span>FDB</span>");
      } else if ($(value).text().includes("g/kg")) {
        $(value).html("<span>gr/lb</span>");
      } else if ($(value).text().includes("m3/h")) {
        $(value).html("<span>CFM</span>");
      } else if ($(value).text().includes("m/s")) {
        $(value).html("<span>SFM</span>");
      } else if ($(value).text().includes("m3")) {
        $(value).html("<span>cubic foot</span>");
      } else if ($(value).text().includes("m2")) {
        $(value).html("<span>square foot</span>");
      } else if ($(value).text().includes("kg/h")) {
        $(value).html("<span>lb/h</span>");
      } else if ($(value).text().includes("kW")) {
        $(value).html("<span>BTU</span>");
      } else if ($(value).text().includes("mbar")) {
        $(value).html("<span>mbar</span>");
      } else if ($(value).text().includes("minutes")) {
        $(value).html("<span>minutes</span>");
      } else if ($(value).text().includes("times")) {
        $(value).html("<span>times</span>");
      } else if ($(value).text().includes("kg")) {
        $(value).html("<span>lb</span>");
      } else if ($(value).text().includes("m")) {
        $(value).html("<span>yard</span>");
      }
    });

    if (check_mode == true) {
      room_calc_result_data = new FormData();
      room_calc_result_data.append('room_calculation_result', JSON.stringify({calculation_mode: "ip",
        capacity_at_starting_climate: $('#start-capacity').text(),
        capacity_at_final_climate: $('#final-capacity').text(),
        tp2: $('#r003_result_tp2').text(),
        xp2: $('#r003_result_xp2').text(),
        mr: $('#r003_result_mr').text(),
        b113: r003_b_needed_moisture_content,
        starting_capacity: $('#start-capacity').text()}));
      Rails.ajax({
        url: '/unit_selection/convert_room_calculation_results',
        type: 'POST',
        data: room_calc_result_data,
        dataType: 'script',
        success: function(result, status, xhr) {
          $.LoadingOverlay("hide");
        },
        error: function(data) {
          $.LoadingOverlay("hide");
        }
      });
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {
      start_capacity = convert_comma_to_dot($('#start-capacity').text())*2.204623;
      final_capacity = convert_comma_to_dot($('#final-capacity').text())*2.204623;
      pre_cooling = convert_comma_to_dot($('#hgf-pre-cooling').val())/1.699;
      ambient = convert_comma_to_dot($('#hgf-ambient').val())/1.699;

      start_moisture = 0.2*(0.1+(r003_vii_total_load_ventilation*2.204623)/(r003_tml*2.204623)*2)*r003_tml/start_capacity;

      array_chart = [['Elapsed time', 'Moisture content in room']]
      elapsed_time = 0;
      moisture_content = r003_start_corresponding_to*7;
      for(i = 0; i < 40; i++){
        array_chart.push([elapsed_time.toFixed(2)+"h", parseFloat(moisture_content.toFixed(2))]);
        elapsed_time = parseFloat(elapsed_time) + parseFloat(start_moisture);
        moisture_content = Math.max((moisture_content-(final_capacity+(start_capacity-final_capacity)*(moisture_content-r003_final_corresponding_to)/
          (r003_start_corresponding_to-r003_final_corresponding_to)-1.2/1000*(r003_vii_total_outdoor*(r003_moisture_content_odc-moisture_content)+pre_cooling*(r003_cdej_corresponding-moisture_content)+ambient*
          (r003_moisture_content_odc-moisture_content))-r003_pitr-r003_total_water_surface-r003_pd-r003_other)*start_moisture*1000/r003_room_volume_vii_tr/1.2), r003_final_corresponding_to);
      }

    data = google.visualization.arrayToDataTable(array_chart);

    options = {
      title: 'Depreciation of moisture content in the room:',
      hAxis: {
        slantedText: true,
        title: 'Elapsed time from start'
      },
      vAxis: {
        title: 'Moisture contnent g/kg'
      },
      legend: { position: 'none' },
      curveType: 'function',
      chartArea: {left: '15%', right: '5%', width: '70%'},
      width: 900,
      height: 700,
    };

      var container = document.getElementById('curve_chart');
      var wrap = document.getElementById('chart_wrap');

      if(window.getComputedStyle(wrap).display == 'none') {
        wrap.style.paddingTop = '0px';
        wrap.style.display = 'block';
        chart = new google.visualization.LineChart(container);
        google.visualization.events.addListener(chart, 'ready', function () {
          wrap.style.display = 'none';
          wrap.style.paddingTop = '48px';
        });
      } else {
        chart = new google.visualization.LineChart(container);
      }

      chart.draw(data, options);
    }

  }));
  $(".general_information_inputs").on("change", "#r003_si_mode", (function() {
    $("input[name=drc_temperature]").val(r003_b7.toFixed(2));
    $("input[name=drc_relative_humidity]").val(r003_b8.toFixed(2));
    $("input[name=drc_atmospheric_pressure]").val(r003_b9.toFixed(2));
    $("input[name=drc_moisture_content]").val(r003_moisture_content_drc.toFixed(2));
    $("input[name=odc_temperature]").val(r003_b13.toFixed(2));
    $("input[name=odc_relative_humidity]").val(r003_b14.toFixed(2));
    $("input[name=odc_atmospheric_pressure]").val(r003_b15.toFixed(2));
    $("input[name=odc_moisture_content]").val(r003_moisture_content_odc.toFixed(2));
    $("input[name=src_temperature]").val(r003_b19.toFixed(2));
    $("input[name=src_relative_humidity]").val(r003_b20.toFixed(2));
    $("input[name=src_atmospheric_pressure]").val(r003_b21.toFixed(2));
    $("input[name=src_moisture_content]").val(r003_moisture_content_src.toFixed(2));
    $("input[name=room_length]").val(r003_b27.toFixed(2));
    $("input[name=room_width]").val(r003_b28.toFixed(2));
    $("input[name=room_height]").val(r003_b29.toFixed(2));
    $("input[name=room_volume]").val(r003_room_volume_vii_tr.toFixed(2));
    $("input[name=without_lock_door_height]").val(r003_b34.toFixed(2));
    $("input[name=without_lock_door_width]").val(r003_c34.toFixed(2));
    $("input[name=air_lock_doors_height]").val(r003_b35.toFixed(2));
    $("input[name=air_lock_doors_width]").val(r003_c35.toFixed(2));
    $("input[name=air_lock_doors_length]").val(r003_d35.toFixed(2));
    $("input[name=wind_speed]").val(r003_b38.toFixed(2));
    $("input[name=without_lock_opened_per_hour]").val(r003_b39.toFixed(2));
    $("input[name=air_lock_vestibule_passages_per_hour]").val(r003_b40.toFixed(2));
    $("input[name=tightness_of_room]").val(r003_room_tightness_vii_tr.toFixed(2));
    $("input[name=door_or_air_lock_infiltration]").val(r003_vii_infiltration_door_air_clock.toFixed(2));
    $("input[name=open_holes]").val(r003_b43.toFixed(2));
    $("input[name=needed_airflow]").val(r003_vii_needed_airflow.toFixed(2));
    $("input[name=mechanical_ventilation]").val(r003_b45.toFixed(2));
    $("input[name=total_ventilation_from_outdoor]").val(r003_vii_total_outdoor.toFixed(2));
    $("input[name=total_ventilation_from_surrounding_rooms]").val(r003_vii_total_surrounding_rooms.toFixed(2));
    $("input[name=percentage_leakage]").val(r003_vii_percentage.toFixed(2));
    $("input[name=total_load_from_ventilation]").val(r003_vii_total_load_ventilation.toFixed(2));

    $("input[name=number_of_people]").val(r003_b52);
    $("input[name=moisture_load_from_each]").val(r003_b53.toFixed(2));
    $("input[name=total_load_from_people]").val(r003_pitr.toFixed(2));

    $("input[name=pool_length]").val(r003_b57.toFixed(2));
    $("input[name=pool_width]").val(r003_b58.toFixed(2));
    $("input[name=pool_surface]").val(r003_ows_pool_surface.toFixed(2));
    $("input[name=water_temperature]").val(r003_b60.toFixed(2));
    $("input[name=vaporization_coefficient]").val(r003_b61.toFixed(2));
    $("input[name=total_load_from_water_surface]").val(r003_total_water_surface.toFixed(2));

    $("input[name=total_weight_of_products]").val(r003_b65.toFixed(2));
    $("input[name=start_percentage_of_moisture]").val((r003_b66*100).toFixed(2));
    $("input[name=percentage_dried_per_hour]").val((r003_b67*100).toFixed(2));
    $("input[name=total_load_from_product_drying]").val(r003_pd.toFixed(2));
    $("input[name=total_load_from_other_sources]").val(r003_other.toFixed(2));
    $("input[name=total_moisture_load]").val(r003_tml.toFixed(2));
    $('.txt_tml').html((r003_tml).toFixed(2) + ' kg/h').addClass('color_red');

    $("input[name=process_airflow]").val(r003_b88.toFixed(2));
    $("input[name=return_air_direct]").val(r003_cdej_return_air_direct.toFixed(2));
    $("input[name=pre_cooled_air]").val(r003_b90.toFixed(2));
    $("input[name=pre_cooling_ambient_air]").val(r003_b91.toFixed(2));
    $("input[name=corresponding_to]").val(r003_cdej_corresponding.toFixed(2));
    $("input[name=ambient_air_direct]").val(r003_cdej_ambient_air.toFixed(2));
    $("input[name=j_before_pre_cooler_degree]").val(r003_cdej_pre_cooler1.toFixed(2));
    $("input[name=j_before_pre_cooler_rate]").val(r003_cdej_pre_cooler2.toFixed(2));
    $("input[name=j_to_a_pre_cooling]").val(r003_b96.toFixed(2));
    $("input[name=inlet_temperature]").val(r003_b99.toFixed(2));
    $("input[name=inlet_moisture_content]").val(r003_cdej_moisture_content.toFixed(2));
    $("input[name=total_wet_air_flow]").val(r003_b102.toFixed(2));
    $("input[name=air_direct_from_pre_cooling]").val(r003_b105.toFixed(2));
    $("input[name=air_direct_from_ambient]").val(r003_b106.toFixed(2));
    $("input[name=total_airflow_to_room]").val(r003_fgh_total_airflow.toFixed(2));
    $("input[name=air_mix_needed_moisture_content]").val(r003_hfg_needed_moisture_content.toFixed(2));
    $('.txt_dry_air_needed_moisture_content').html((r003_hfg_needed_moisture_content).toFixed(2) + ' g/kg').addClass('color_red');
    $("input[name=leakage]").val(r003_fgh_leakage.toFixed(2));
    $("input[name=total_dry_air_flow]").val(r003_b112.toFixed(2));
    $("input[name=dry_air_needed_moisture_content]").val(r003_b_needed_moisture_content.toFixed(2));
    $("input[name=dry_air_temperature]").val(r003_b_dry_air_temperature.toFixed(2));
    $("input[name=heat_load]").val(r003_b_heat_load.toFixed(2));

    $('#j_before_pre_cooler_degree_start').val((r003_b120).toFixed(2));
    $('#j_before_pre_cooler_rate_start').val((r003_b121).toFixed(2));
    $('#inlet_temperature_start').val((r003_b124).toFixed(2));
    $('#inlet_moisture_content_start').val((r003_b125).toFixed(2));

    $('#r003_result_process_airflow').text(r003_b88.toFixed(2));
    $('#r003_result_return_air_direct').text(r003_cdej_return_air_direct.toFixed(2));
    $('#r003_result_pre_cooled_air').text(r003_b90.toFixed(2));
    $('#r003_result_pre_cooling_ambient').text(r003_b91.toFixed(2));
    $('#r003_result_corresponding_to').text(r003_cdej_corresponding.toFixed(2));
    $('#r003_result_ambient_air').text(r003_cdej_ambient_air.toFixed(2));
    $('#r003_result_before_pre_cooler1').text(r003_cdej_pre_cooler1.toFixed(2));
    $('#r003_result_before_pre_cooler2').text(r003_cdej_pre_cooler2.toFixed(2));
    $('#r003_result_pre_cooling_before').text(r003_b96.toFixed(2));
    $('#r003_result_temperature').text(r003_b99.toFixed(2));
    $('#r003_result_moisture_content').text(r003_cdej_moisture_content.toFixed(2));
    $('#r003_result_pre_cooling').text(r003_b105.toFixed(2));
    $('#r003_result_ambient').text(r003_b106.toFixed(2));
    $('#r003_result_leakage').text(r003_fgh_leakage.toFixed(2));


    $('#r003_result_total_dry_air_flow').text(r003_b112.toFixed(2));

    $('#final-temperature').text(r003_b7);
    $('#final-relative-humidity').text(r003_b8);
    $('#final-atmospheric-pressure').text(r003_b9);
    $('#final-corresponding-to').text(r003_moisture_content_drc.toFixed(2));
    if ($("#check-door").val() == 1) {
      $('#start-temperature').text(r003_b13);
      $('#start_temperature').val(r003_b13);
      $('#start-relative-humidity').text(r003_b14);
      $('#start-atmospheric-pressure').text(r003_b15);
      $('#start-corresponding-to').text(r003_moisture_content_odc.toFixed(2));
    } else {
      $('#start-temperature').text(r003_b19);
      $('#start_temperature').val(r003_b19);
      $('#start-relative-humidity').text(r003_b20);
      $('#start-atmospheric-pressure').text(r003_b21);
      $('#start-corresponding-to').text(r003_moisture_content_src.toFixed(2));
    }

    $.each( $(".dropdown-unit"), function( i, value ){
      capacity = $(value).data("capacity");
      $(value).find("span.color_red").html(capacity + " kg/h at 20" + "<sup>o</sup>" + "C/60%RH");
    });
    current_unit_id = $("#room_calculation_unit_id").val();
    current_unit = $(".scroll_unit").find(`[data-id=${current_unit_id}]`);
    $(".unit_button").text(current_unit.data("name") + "," + current_unit.find("span.color_red").text());

    $.each($('.measure'), function( index, value ){
      if ($(value).text().includes("FDB")) {
        $(value).html("<span><sup>o</sup>C</span>");
      } else if ($(value).text().includes("gr/lb")) {
        $(value).html("<span>g/kg</span>");
      } else if ($(value).text().includes("cubic foot")) {
        $(value).html("<span>m3</span>");
      } else if ($(value).text().includes("SFM")) {
        $(value).html("<span>m/s</span>");
      } else if ($(value).text().includes("CFM")) {
        $(value).html("<span>m3/h</span>");
      } else if ($(value).text().includes("square foot")) {
        $(value).html("<span>m2</span>");
      } else if ($(value).text().includes("lb/h")) {
        $(value).html("<span>kg/h</span>");
      } else if ($(value).text().includes("BTU")) {
        $(value).html("<span>kW</span>");
      } else if ($(value).text().includes("lb")) {
        $(value).html("<span>kg</span>");
      } else if ($(value).text().includes("yard")) {
        $(value).html("<span>m</span>");
      }
    });

    if (check_mode == true) {
      room_calc_result_data = new FormData();
      room_calc_result_data.append('room_calculation_result', JSON.stringify(
        {calculation_mode: "si",
        capacity_at_starting_climate: $('#start-capacity').text(),
        capacity_at_final_climate: $('#final-capacity').text(),
        tp2: $('#r003_result_tp2').text(),
        xp2: $('#r003_result_xp2').text(),
        mr: $('#r003_result_mr').text(),
        b113: r003_b_needed_moisture_content,
        starting_capacity: $('#start-capacity').text()}));
      Rails.ajax({
        url: '/unit_selection/convert_room_calculation_results',
        type: 'POST',
        data: room_calc_result_data,
        dataType: 'script',
        success: function(result, status, xhr) {
          $.LoadingOverlay("hide");
        },
        error: function(data) {
          $.LoadingOverlay("hide");
        }
      });
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
    }

    function drawChart() {
      start_capacity = convert_comma_to_dot($('#start-capacity').text())/2.204623;
      final_capacity = convert_comma_to_dot($('#final-capacity').text())/2.204623;
      pre_cooling = convert_comma_to_dot($('#hgf-pre-cooling').val())*1.699;
      ambient = convert_comma_to_dot($('#hgf-ambient').val())*1.699;

      start_moisture = 0.2*(0.1+r003_vii_total_load_ventilation/r003_tml*2)*r003_tml/start_capacity;

      array_chart = [['Elapsed time', 'Moisture content in room']]
      elapsed_time = 0;
      moisture_content = r003_start_corresponding_to;
      for(i = 0; i < 40; i++){
        array_chart.push([elapsed_time.toFixed(2)+"h", parseFloat(moisture_content.toFixed(2))]);
        elapsed_time = parseFloat(elapsed_time) + parseFloat(start_moisture);
        moisture_content = Math.max((moisture_content-(final_capacity+(start_capacity-final_capacity)*(moisture_content-r003_final_corresponding_to)/
          (r003_start_corresponding_to-r003_final_corresponding_to)-1.2/1000*(r003_vii_total_outdoor*(r003_moisture_content_odc-moisture_content)+pre_cooling*(r003_cdej_corresponding-moisture_content)+ambient*
          (r003_moisture_content_odc-moisture_content))-r003_pitr-r003_total_water_surface-r003_pd-r003_other)*start_moisture*1000/r003_room_volume_vii_tr/1.2), r003_final_corresponding_to);
      }

    data = google.visualization.arrayToDataTable(array_chart);

    options = {
      title: 'Depreciation of moisture content in the room:',
      hAxis: {
        slantedText: true,
        title: 'Elapsed time from start'
      },
      vAxis: {
        title: 'Moisture contnent g/kg'
      },
      legend: { position: 'none' },
      curveType: 'function',
      chartArea: {left: '15%', right: '5%', width: '70%'},
      width: 900,
      height: 700,
    };

      var container = document.getElementById('curve_chart');
      var wrap = document.getElementById('chart_wrap');

      if(window.getComputedStyle(wrap).display == 'none') {
        wrap.style.paddingTop = '0px';
        wrap.style.display = 'block';
        chart = new google.visualization.LineChart(container);
        google.visualization.events.addListener(chart, 'ready', function () {
          wrap.style.display = 'none';
          wrap.style.paddingTop = '48px';
        });
      } else {
        chart = new google.visualization.LineChart(container);
      }

      chart.draw(data, options);
    }

  }));
});
