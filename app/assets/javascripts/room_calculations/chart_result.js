function calculation_chart_result(){
  $('#start-calculation').click(function() {
    unit_valid = $('#room_calculation_unit_id').valid();
    category_valid = $('#room_calculation_category_id').valid();
    number_of_units_valid = $('#number_of_units').valid();
    drc_temperature = $('#drc-temperature').valid();
    drc_relative_humidity = $('#drc-relative-humidity').valid();
    src_height_above_sea_level = $('#src_height_above_sea_level').valid();
    drc_height_above_sea_level = $('#drc_height_above_sea_level').valid();
    odc_height_above_sea_level = $('#odc_height_above_sea_level').valid();
    dehumidified_room = $('#dehumidified-room').valid();
    odc_temperature = $('#odc-temperature').valid();
    odc_relative_humidity = $('#odc-relative-humidity').valid();
    src_temperature = $('#src-temperature').valid();
    src_relative_humidity = $('#src-relative-humidity').valid();
    vii_room_length = $('#vii-room-length').valid();
    vii_room_width = $('#vii-room-width').valid();
    vii_room_height = $('#vii-room-height').valid();
    vii_tightness_of_building = $('#vii-tightness-of-building').valid();
    vii_surroundings = $('#vii-surroundings').valid();
    vii_door_height = $('#vii-door-height').valid();
    vii_door_width = $('#vii-door-width').valid();
    vii_air_lock_vestibule_height = $('#vii-air-lock-vestibule-height').valid();
    vii_air_lock_vestibule_width = $('#vii-air-lock-vestibule-width').valid();
    vii_air_lock_vestibule_length = $('#vii-air-lock-vestibule-length').valid();
    check_door = $('#check-door').valid();
    vii_wind_speed = $('#vii-wind-speed').valid();
    vii_door_without_air_lock = $('#vii-door-without-air-lock').valid();
    vii_air_lock_vestibule = $('#vii-air-lock-vestibule').valid();
    vii_open_holes = $('#vii-open-holes').valid();
    vii_mechanical_ventilation = $('#vii-mechanical-ventilation').valid();
    pitr_number_people = $('#pitr-number-people').valid();
    pitr_moisture_load = $('#pitr-moisture-load').valid();
    ows_pool_length = $('#ows-pool-length').valid();
    ows_pool_width = $('#ows-pool-width').valid();
    ows_water_temperature = $('#ows-water-temperature').valid();
    ows_vaporization_coefficient = $('#ows-vaporization-coefficient').valid();
    pd_total_weight_product = $('#pd-total-weight-product').valid();
    pd_percentage_moisture = $('#pd-percentage-moisture').valid();
    pd_percentage_dried = $('#pd-percentage-dried').valid();
    other = $('#other').valid();
    a_dr_model = $('#a-dr-model').valid();
    b_dry_air_temperature = $('#b-dry-air-temperature').valid();
    cdej_process_airflow = $('#cdej-process-airflow').valid();
    cdej_return_air_direct = $('#cdej-return-air-direct').valid();
    cdej_pre_cooled_air = $('#cdej-pre-cooled-air').valid();
    cdej_pre_cooling_ambient = $('#cdej-pre-cooling-ambient').valid();
    cdej_pre_cooling_before = $('#cdej-pre-cooling-before').valid();
    hgf_pre_cooling = $('#hgf-pre-cooling').valid();
    hgf_ambient = $('#hgf-ambient').valid();

    if(!(number_of_units_valid && drc_temperature&& drc_relative_humidity&& src_height_above_sea_level && drc_height_above_sea_level && odc_height_above_sea_level && dehumidified_room&& odc_temperature&& odc_relative_humidity&& src_temperature&& src_relative_humidity&& vii_room_length&& vii_room_width&& vii_room_height&& vii_tightness_of_building&& vii_surroundings&& vii_door_height&& vii_door_width&& vii_air_lock_vestibule_height&& vii_air_lock_vestibule_width&& vii_air_lock_vestibule_length&& check_door&& vii_wind_speed&& vii_door_without_air_lock&& vii_air_lock_vestibule&& vii_open_holes&& vii_mechanical_ventilation&& pitr_number_people&& pitr_moisture_load&& ows_pool_length&& ows_pool_width&& ows_water_temperature&& ows_vaporization_coefficient&& pd_total_weight_product&& pd_percentage_moisture&& pd_percentage_dried&& other&& a_dr_model&& b_dry_air_temperature&& cdej_process_airflow&& cdej_return_air_direct&& cdej_pre_cooled_air&& cdej_pre_cooling_ambient&& cdej_pre_cooling_before&& hgf_pre_cooling&& hgf_ambient)) {
      $('#modal_invalid_message').modal('show');
      $('.slick-slide').each(function() {
        if ($(`${$(this).find('.nav-link').attr('href')} input.error.text-danger[type!=hidden]`).length > 0) {
          $(this).find('.nav-link').addClass('error-tab');
        }
      });

      error_tab_first_id = `#${$(`input.error.text-danger[type!=hidden]`).first().closest('.tab-pane').attr('id')}`;
      section_paginate_button = $(`.css-autow .nav-link[href='${error_tab_first_id}']`);

      section_paginate_button.click();
      $(`.css-autow .nav-link`).removeClass('active');
      section_paginate_button.addClass('active');
      $('.slick-slide[current=true]').attr('current', false);
      section_paginate_button
        .closest('.slick-slide').not('.slick-cloned').attr('current', true);

      position = section_paginate_button
        .parent().data('index');

      slick.slick("slickGoTo", parseInt(position));

      $('html, body').animate({
        scrollTop: ($('#anchor_to_scroll').offset().top)
      }, 500);
      return;
    }

    if(!(unit_valid && category_valid)) { return; }

    $.LoadingOverlay("show");

    mode = $("#r003_si_mode").is(":checked") ? "si" : "ip"
    backup_unit_id = $("#room_calculation_unit_id").val();

    if ($(".r003_category").text().includes("Recusorb 1")) {
      getDataRoomCalc(sort_unit_recusords);
    } else {
      getDataRoomCalc(sort_unit_consords);
    }

    room_calc_data = new FormData();
    room_calc_data.append('room_calculation_result', JSON.stringify({calculation_data: room_calc_data_sort, calculation_mode: mode}));
    Rails.ajax({
      url: '/room_calculation_results',
      type: 'POST',
      data: room_calc_data,
      dataType: 'script',
      success: function(result, status, xhr) {
        if(xhr.getResponseHeader('calculation_result') == false || xhr.getResponseHeader('calculation_result') == 'false') {
        } else {
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);
        }
        $.LoadingOverlay("hide");
      },
      error: function(data) {
        $.LoadingOverlay("hide");
      }
    });
    function getDataRoomCalc(sort_unit) {
      room_calc_data_sort = [];
      auto_b132 = ($("#door_to_outdoor_air").val() == 1) ? r003_b13 : r003_b19;
      auto_b133 = ($("#door_to_outdoor_air").val() == 1) ? r004_b14 : r003_b20;
      auto_b134 = r003_b9;
      auto_b135 = 622/(auto_b134/Math.exp(12.03-4025/(auto_b132+235))/10/auto_b133-1)
      for(var i = 0; i < sort_unit.length; i++){
        auto_b102 = $(sort_unit[i]).data("wet-air")*number_of_unit;
        auto_b88 = $(sort_unit[i]).data("dry-air")*number_of_unit;
        auto_b112 = auto_b88 - auto_b102;
        auto_b89 = Math.max(auto_b88-auto_b102-e110-r003_b90,0);
        auto_b93 = auto_b88-r003_b90-auto_b89+r003_b105;

        auto_b92 = Math.min(622/(r003_b15/Math.exp(12.03-4025/(r003_b91+235))/1000-1),r003_moisture_content_odc);
        auto_b95 = (auto_b89*r003_moisture_content_drc+(r003_b90-r003_b105)*auto_b92+auto_b93*r003_moisture_content_odc)/auto_b88;
        auto_b94 = (auto_b89*r003_b7+(r003_b90-r003_b105)*r003_b91+auto_b93*r003_b13)/auto_b88;
        auto_b96 = (i == 0) ? r003_b96 : auto_b94;
        auto_b100 = (622/(r003_b9/Math.exp(12.03-4025/(auto_b96+235))/10/100-1) < auto_b95) ? 622/(r003_b9/Math.exp(12.03-4025/(auto_b96+235))/10/100-1) : auto_b95;
        auto_b99 = auto_b96;
        auto_b107 = r003_b106+r003_b105+auto_b88-auto_b102;
        auto_b110 = r003_b106+auto_b112+r003_b105-auto_b89;
        tmp_108 = (auto_b110 > r003_vii_total_outdoor) ? r003_vii_total_load_ventilation : (r003_moisture_content_odc-r003_moisture_content_drc)/1000*auto_b110*1.2;
        auto_b108 = r003_moisture_content_drc-1000*(r003_tml - tmp_108)/auto_b107/1.2;

        auto_b113 = (auto_b107*auto_b108-r003_b106*r003_moisture_content_odc-r003_b105*auto_b92)/auto_b112;

        auto_b120 = (auto_b89*auto_b132+(r003_b90-r003_b105)*r003_b91+auto_b93*r003_b13)/auto_b88;
        auto_b121 = (auto_b89*auto_b135+(r003_b90-r003_b105)*auto_b92+auto_b93*r003_moisture_content_odc)/auto_b88;
        if (i == 0){
          if (convert_comma_to_dot($('#cdej-pre-cooling-before').val()) == convert_comma_to_dot($('#cdej-before-pre-cooler1').val())) {
            auto_b124 = auto_b120;
          } else {auto_b124 = auto_b96;}

        } else {auto_b124 = auto_b120;}

        auto_b125 = (622/(r003_b9/Math.exp(12.03-4025/(auto_b124+235))/10/100-1)<auto_b121) ? 622/(r003_b9/Math.exp(12.03-4025/(auto_b124+235))/10/100-1) : auto_b121
        if ($("#r003_si_mode").is(":checked")){
          room_calc_data_sort.push({unit_id: $(sort_unit[i]).data('id'), b102: auto_b102.toFixed(2), b13: r003_b13, b16: r003_moisture_content_odc, b88: auto_b88.toFixed(2), b112: auto_b112.toFixed(2), b100: auto_b100.toFixed(2), b99: auto_b99.toFixed(2), b124: auto_b124.toFixed(2), b125: auto_b125.toFixed(2), b113: auto_b113.toFixed(2), height_above_sea_level: convert_comma_to_dot($('#drc_height_above_sea_level').val())});
        } else {
          room_calc_data_sort.push({unit_id: $(sort_unit[i]).data('id'), b102: auto_b102.toFixed(2), b13: r003_b13, b16: r003_moisture_content_odc, b88: auto_b88.toFixed(2), b112: auto_b112.toFixed(2), b100: auto_b100.toFixed(2), b99: auto_b99.toFixed(2), b124: auto_b124.toFixed(2), b125: auto_b125.toFixed(2), b113: auto_b113.toFixed(2), height_above_sea_level: convert_comma_to_dot($('#drc_height_above_sea_level').val())});
        }
      }
      return room_calc_data_sort;
    }


    function drawChart() {
      start_capacity = convert_comma_to_dot($('#start-capacity').text());
      final_capacity = convert_comma_to_dot($('#final-capacity').text());
      pre_cooling = convert_comma_to_dot($('#hgf-pre-cooling').val());
      ambient = convert_comma_to_dot($('#hgf-ambient').val());
      start_moisture = 0.2*(0.1+r003_vii_total_load_ventilation/r003_tml*2)*r003_tml/start_capacity;
      array_chart = [['Elapsed time', 'Moisture content in room']]
      elapsed_time = 0;

      if ($("#r003_si_mode").is(":checked")){
        moisture_content = r003_start_corresponding_to;
      } else {
        moisture_content = r003_start_corresponding_to*7;
      }
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
  });
}

$(document).ready(function() {
  calculation_chart_result();
});
