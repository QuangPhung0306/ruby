$(document).ready(function() {
  window.special_model_name = ['DR-010 B', 'DR-20B', 'DR-30D', 'DR-40-T10',
    'DR-40-T16', 'DR-50 R', 'CS-5', 'CS-5L'];
  window.calculation_mode = true;
  window.ac_supply_air_sa = '';
  window.textbox2 = '';
  window.textbox50 = '';  
  window.f_flow_rate = '';
  window.n_flow_rate = '';
  window.g_flow_rate = '';
  window.h_flow_rate = '';
  window.p_flow_rate = '';
  window.l_flow_rate = '';
  window.d_flow_rate = '';

  window.p_temperature = '';
  window.k_temperature = '';
  window.d_temperature = '';

  window.d_absolute_humidity = '';
  window.e_anode_capacity = '';

  // choosen category
  window.height_above_sea_level = -6.2;
  $('#height_above_sea_level').change(function() {
    window.height_above_sea_level = convert_comma_to_dot($('#height_above_sea_level').val());
  });

  window.ac_atmospheric_pressure = 1014;
  $('#ac_atmospheric_pressure').val(ac_atmospheric_pressure).trigger('change');

  window.hot_water_in = 40;
  window.hot_water_out = 35;
  $('#hot_water_in').val(hot_water_in).trigger('change');
  $('#hot_water_out').val(hot_water_out).trigger('change');

  window.total_cooling_power = 0;

  window.ac_water_temperature_in = 7;
  $('#ac_water_temperature_in').val(ac_water_temperature_in).trigger('change');

  window.ac_water_temperature_out = 12;
  $('#ac_water_temperature_out').val(ac_water_temperature_out).trigger('change');


  $('#ac_water_temperature_in').change(function() {
    window.ac_water_temperature_in = valueTemperatureToSetGlobal(convert_comma_to_dot($('#ac_water_temperature_in').val()));

    $('#n_temperature').blur();
    $('#g_temperature').blur();
    $('#j_temperature_display').blur();
    $('#l_temperature').blur();
    $('#e_temperature_display').blur();
  });

  $('#air_mixture_inputs').find('.dropdown-category').click(function() {
    $('#air_mixture_unit_id').val('');
    $('#dropdown_unit_box').find('.btn_ct_sl').html('+ Choose one');
    $('.dropdown-unit').each(function(){
      $(this).show();
    });
    var category_id = $(this).data('id');
    window.m_category_name = $(this).data('category-name');
    $('#air_mixture_category_id').val(category_id);
    $('.dropdown-unit').filter('[data-category-id!=' + category_id + ']').each(function() {
      $(this).hide();
    });
    if (convert_comma_to_dot($('#ac_supply_air_sa').val()) > 0) {
      $('#ac_supply_air_sa').trigger('change');
    }
  });

  $('#item-categories.air-mixture-categories a:nth-child(1)').click();

  //choosen unit
  $('#air_mixture_inputs').find('.dropdown-unit').click(function() {
    window.selected_unit_id = $(this).data('id');
    choosenUnit(selected_unit_id);
  });

  $('#textbox2').change(function() {
    var infinitive_textbox2 = convert_comma_to_dot($(this).val());
    window.textbox2 = valueTemperatureToSetGlobal(infinitive_textbox2);
  });

  $('#textbox50').change(function() {
    var infinitive_textbox50 = convert_comma_to_dot($(this).val());
    window.textbox50 = valueCoolerToSetGlobal(infinitive_textbox50);
  });

  //Start here
  $('#ac_supply_air_sa').keyup(function() {
    var infinitive_ac_supply_air_sa = convert_comma_to_dot($(this).val());
    window.ac_supply_air_sa = valueFlowRateToSetGlobal(infinitive_ac_supply_air_sa);

    if (ac_supply_air_sa == "") {window.ac_supply_air_sa = 0}
    $("#read_supply_air_sa").find('.frm_gr_inp').val(infinitive_ac_supply_air_sa);

    window.ac_outside_air_oa = ac_supply_air_sa * 0.1;
    // setValueSectionElement('ac_outside_air_oa', ac_outside_air_oa);

    if ($.isNumeric(ac_outside_air_oa)) {
      var to_fixed_value = toFixedValue(valueFlowRateToSetElement(ac_outside_air_oa));
      $('#ac_outside_air_oa_show').val(to_fixed_value);
      $('#ac_outside_air_oa_show').blur();
      $('#ac_outside_air_oa').val(valueFlowRateToSetElement(ac_outside_air_oa)).trigger('change');
    } else {
      $('#ac_outside_air_oa_show').val("N/A");
      $('#ac_outside_air_oa').val("N/A").trigger('change');
    };
  });

  $('#ac_supply_air_sa').change(function() {
    var infinitive_ac_supply_air_sa = convert_comma_to_dot($(this).val());
    window.ac_supply_air_sa = valueFlowRateToSetGlobal(infinitive_ac_supply_air_sa);

    var difference = Number.MAX_SAFE_INTEGER;
    var unit_id = 0;
    var dry_air = Number.MAX_SAFE_INTEGER;
    var category_id = $('#air_mixture_category_id').val();
    $('.dropdown-unit').filter('[data-category-id=' + category_id + ']').each(function() {
      dry_air = valueFlowRateToSetGlobal($(this).attr('data-dry-air'));
      if ((ac_supply_air_sa - dry_air) >= 0 && (ac_supply_air_sa - dry_air < difference)) {
        difference = ac_supply_air_sa - dry_air;
        unit_id = $(this).data('id');
      }
    });
    if (unit_id > 0) {
      $('#air_mixture_unit_id').val(unit_id);
      var recommend_unit = $('#item-units').find(`a[data-id='${unit_id}']`);
      var dry_air_unit = calculation_mode ? "m3/h" : "CFM";

      $('#dropdown_unit_box').find('.btn_ct_sl').html(`${recommend_unit.data('model-name')}, ${toFixedValue(recommend_unit.attr('data-dry-air'))} ${dry_air_unit}`);
      $('#dropdown_unit_box').find('.btn_ct_sl').addClass('color_green');
      window.selected_unit_id = unit_id;
      choosenUnit(selected_unit_id);
    } else {
      $('#modal_recommend_unit').modal('show');
    };
    get_change_values(1);
  });

  $('#ac_outside_air_oa_show').change(function() {
    var infinitive_ac_outside_air_oa_show = convert_comma_to_dot($(`#ac_outside_air_oa_show`).val());
    $('#ac_outside_air_oa').val(infinitive_ac_outside_air_oa_show).trigger('change');
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(infinitive_ac_outside_air_oa_show);
  });

  $('#ac_outside_air_oa').keyup(function() {
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(convert_comma_to_dot($(this).val()));
  });

  $('#ac_supply_air_sa, #ac_outside_air_oa').change(function() {
    window.ac_supply_air_sa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_supply_air_sa').val()));
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_outside_air_oa').val()));

    if (typeof m_special_dry_air != 'undefined') {
      window.a_flow_rate = m_special_dry_air - m_unit_dry_air + ac_supply_air_sa - ac_outside_air_oa;
      setValueSectionElement('a_flow_rate', valueFlowRateToSetElement(a_flow_rate));
    };

    if (typeof m_unit_dry_air != 'undefined') {
      window.c_flow_rate = ac_supply_air_sa - m_unit_dry_air;
      setValueSectionElement('c_flow_rate', valueFlowRateToSetElement(c_flow_rate));
    };

    //set value ac_outside_air_oa, f1, g1, d1, e1, a1, c1
    window.f_flow_rate = ac_outside_air_oa;
    window.g_flow_rate = ac_outside_air_oa;
    window.d_flow_rate = ac_supply_air_sa;
    window.e_flow_rate = ac_supply_air_sa;

    setValueSectionElement('f_flow_rate', valueFlowRateToSetElement(ac_outside_air_oa));
    setValueSectionElement('g_flow_rate', valueFlowRateToSetElement(ac_outside_air_oa));
    setValueSectionElement('d_flow_rate', valueFlowRateToSetElement(ac_supply_air_sa));
    setValueSectionElement('e_flow_rate', valueFlowRateToSetElement(ac_supply_air_sa));
  });

  //Outside air(M)
  $('#r_flow_rate').change(function() {
    window.r_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#r_flow_rate').val()));
    setMNFlowRateValue();
  });

  //Outside air OA(F)
  $('#f_temperature').change(function() {
    window.f_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#f_temperature').val()));
    setValueSectionElement('m_temperature', valueTemperatureToSetElement(f_temperature));
    setValueSectionElement('g_temperature', valueTemperatureToSetElement(f_temperature));
  });

  $('#m_temperature').change(function() {
    window.m_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#m_temperature').val()));
    setValueSectionElement('n_temperature', valueTemperatureToSetElement(m_temperature));
  });

  $('#f_absolute_humidity').change(function() {
    // f3 = m3
    window.f_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#f_absolute_humidity').val()));
    setValueSectionElement('m_absolute_humidity', valueAbsoluteHumidityToSetElement(f_absolute_humidity));
  });

  //Pre-cooler2(N)
  $('#ac_atmospheric_pressure, #f_absolute_humidity, #n_temperature').change(function() {
    window.ac_atmospheric_pressure = convert_comma_to_dot($('#ac_atmospheric_pressure').val());
    window.f_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#f_absolute_humidity').val()));
    window.n_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#n_temperature').val()));
    setAbsoluteHumidity('ac_atmospheric_pressure', 'f_absolute_humidity', 'n_temperature', 'n_absolute_humidity');
  });

  $('#m_flow_rate, #n_temperature, #n_absolute_humidity, #f_temperature, #f_absolute_humidity').change(function() {
    window.m_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#m_flow_rate').val()));
    window.n_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#n_temperature').val()));
    window.n_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#n_absolute_humidity').val()));
    window.m_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#m_temperature').val()));
    window.m_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#m_absolute_humidity').val()));

    M1 = m_flow_rate;
    N2 = n_temperature;
    N3 = n_absolute_humidity;
    F2 = m_temperature;
    F3 = m_absolute_humidity;

    window.n_cathode_capacity = valueCoolerToSetGlobal((M1*1.2/3600*(F2+F3/1000*(2500+1.86*F2)-(N2+N3/1000*(2500+1.86*N2)))));
    setValueSectionElement('n_cathode_capacity', valueCoolerToSetElement(n_cathode_capacity));
  });

  $('#m_flow_rate, #m_absolute_humidity, #n_absolute_humidity').change(function() {
    window.m_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#m_flow_rate').val()));
    window.n_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#n_absolute_humidity').val()));
    window.m_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#m_absolute_humidity').val()));

    M1 = m_flow_rate;
    N3 = n_absolute_humidity;
    M3 = m_absolute_humidity;

    window.n_cathode_flow_rate = valueHeaterPowerToSetGlobal((M1*1.2*(M3-N3)/1000));
    setValueSectionElement('n_cathode_flow_rate', valueHeaterPowerToSetElement(n_cathode_flow_rate));
  });

  //Pre-cooler1/Heater(G)
  $('#ac_atmospheric_pressure, #f_absolute_humidity, #g_temperature').change(function() {
    window.ac_atmospheric_pressure = convert_comma_to_dot($('#ac_atmospheric_pressure').val());
    window.f_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#f_absolute_humidity').val()));
    window.g_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#g_temperature').val()));

    setAbsoluteHumidity('ac_atmospheric_pressure', 'f_absolute_humidity', 'g_temperature', 'g_absolute_humidity');
  });

  $('#ac_outside_air_oa, #g_temperature, #g_absolute_humidity, #f_temperature, #f_absolute_humidity').change(function() {
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_outside_air_oa').val()));
    window.f_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#f_temperature').val()));
    window.f_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#f_absolute_humidity').val()));
    window.g_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#g_temperature').val()));
    window.g_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#g_absolute_humidity').val()));

    AC2 = ac_outside_air_oa;
    F2 = f_temperature;
    F3 = f_absolute_humidity;
    G2 = g_temperature;
    G3 = g_absolute_humidity;

    window.g_anode_capacity = valueHeaterPowerToSetGlobal(Math.max(AC2/3000*(G2-F2+G3/1000*1.86*(G2-F2)),0));
    setValueSectionElement('g_anode_capacity', valueHeaterPowerToSetElement(g_anode_capacity));
    window.g_cathode_capacity = valueHeaterPowerToSetGlobal(Math.max(AC2*1.2/3600*(F2+F3/1000*(2500+1.86*F2)-(G2+G3/1000*(2500+1.86*G2))),0));
    setValueSectionElement('g_cathode_capacity', valueHeaterPowerToSetElement(g_cathode_capacity));
  });

  $('#ac_outside_air_oa, #f_absolute_humidity, #g_absolute_humidity').change(function() {
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_outside_air_oa').val()));
    window.f_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#f_absolute_humidity').val()));
    window.g_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#g_absolute_humidity').val()));

    AC2 = ac_outside_air_oa;
    F3 = f_absolute_humidity;
    G3 = g_absolute_humidity;

    window.g_cathode_flow_rate = valueCoolerToSetGlobal((AC2*1.2*(F3-G3)/1000));
    setValueSectionElement('g_cathode_flow_rate', valueCoolerToSetElement(g_cathode_flow_rate));
  });
  //End Pre-cooler1/Heater(G)

  //Mixed air2(H)
  $('#ac_outside_air_oa, #a_flow_rate').change(function() {
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_outside_air_oa').val()));
    window.a_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#a_flow_rate').val()));

    window.h_flow_rate = ac_outside_air_oa + a_flow_rate;
    setValueSectionElement('h_flow_rate', valueFlowRateToSetElement(h_flow_rate));
  });

  //h2
  $('#ac_outside_air_oa, #a_flow_rate, #a_temperature, #g_temperature').change(function() {
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_outside_air_oa').val()));
    window.g_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#g_temperature').val()));
    window.a_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#a_flow_rate').val()));
    window.a_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#a_temperature').val()));

    AC2 = ac_outside_air_oa;
    G2 = g_temperature;
    A1 = a_flow_rate;
    A2 = a_temperature;

    window.h_temperature = (AC2*G2+A1*A2)/(AC2+A1);
    window.c_temperature = h_temperature;
    window.j_temperature = h_temperature;
    //h2 = c2
    setValueSectionElement('h_temperature', valueTemperatureToSetElement(h_temperature));
    setValueSectionElement('c_temperature', valueTemperatureToSetElement(h_temperature));
    setInputDisplayElement('j_temperature', valueTemperatureToSetElement(h_temperature));
  });

  //h3
  $('#ac_outside_air_oa, #a_flow_rate, #a_absolute_humidity, #g_absolute_humidity').change(function() {
    window.ac_outside_air_oa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_outside_air_oa').val()));
    window.g_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#g_absolute_humidity').val()));
    window.a_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#a_flow_rate').val()));
    window.a_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#a_absolute_humidity').val()));

    AC2 = ac_outside_air_oa;
    G3 = g_absolute_humidity; 
    A1 = a_flow_rate;
    A3 = a_absolute_humidity;

    window.h_absolute_humidity = (AC2*G3+A1*A3)/(AC2+A1);
    window.c_absolute_humidity = h_absolute_humidity;
    //h3 = c3
    setValueSectionElement('h_absolute_humidity', valueAbsoluteHumidityToSetElement(h_absolute_humidity));
    setValueSectionElement('c_absolute_humidity', valueAbsoluteHumidityToSetElement(h_absolute_humidity));
  });

  //Regeneration air(P)
  //p2
  $('#h_temperature, #r_flow_rate, #r_temperature, #m_flow_rate, #n_temperature').change(function() {
    window.h_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#h_temperature').val()));
    window.r_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#r_flow_rate').val()));
    window.r_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#r_temperature').val()));
    window.m_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#m_flow_rate').val()));
    window.n_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#n_temperature').val()));

    setPTemperature();
  });

  $('#r_flow_rate, #r_temperature, #m_flow_rate, #n_absolute_humidity, #j_absolute_humidity').change(function() {
    window.r_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#r_flow_rate').val()));
    window.r_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#r_temperature').val()));
    window.m_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#m_flow_rate').val()));
    window.n_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#n_absolute_humidity').val()));

    setPAbsoluteHumidity();
  });

  //Process air(J)
  //j2
  $('#j_temperature_display').change(function() {
    var j_temperature_display = $('#j_temperature_display').val();
    $('#j_temperature').val(j_temperature_display).trigger('change');
    window.j_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($(`#j_temperature`).val()));
  });
  //j3
  $('#ac_atmospheric_pressure, #j_temperature, #h_absolute_humidity').change(function() {
    window.ac_atmospheric_pressure = convert_comma_to_dot($('#ac_atmospheric_pressure').val());
    window.j_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#j_temperature').val()));
    window.h_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#h_absolute_humidity').val()));

    setAbsoluteHumidity('ac_atmospheric_pressure', 'h_absolute_humidity', 'j_temperature', 'j_absolute_humidity');
  });

  $('#j_flow_rate, #j_temperature, #j_absolute_humidity, #h_temperature, #h_absolute_humidity').change(function() {
    window.j_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#j_flow_rate').val()));
    window.j_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#j_temperature').val()));
    window.j_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#j_absolute_humidity').val()));
    window.h_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#h_temperature').val()));
    window.h_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#h_absolute_humidity').val()));

    J1 = j_flow_rate;
    J2 = j_temperature;
    J3 = j_absolute_humidity;
    H2 = h_temperature;
    H3 = h_absolute_humidity;

    window.j_cathode_capacity = valueCoolerToSetGlobal(J1*1.2/3600*(H2+H3/1000*(2500+1.86*H2)-(J2+J3/1000*(2500+1.86*J2))));
    setValueSectionElement('j_cathode_capacity', valueCoolerToSetElement(j_cathode_capacity));
  });

  $('#a_temperature').change(function() {
    window.a_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#a_temperature').val()));
    setValueSectionElement('r_temperature', valueTemperatureToSetElement(a_temperature));
  });

  $('#a_absolute_humidity').change(function() {
    window.a_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#a_absolute_humidity').val()));
    window.r_absolute_humidity = a_absolute_humidity;
    setValueSectionElement('r_absolute_humidity', valueAbsoluteHumidityToSetElement(a_absolute_humidity));
  });

  $('#j_flow_rate, #j_absolute_humidity, #h_absolute_humidity').change(function() {
    window.j_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#j_flow_rate').val()));
    window.j_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#j_absolute_humidity').val()));
    window.h_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#h_absolute_humidity').val()));

    J1 = j_flow_rate;
    J3 = j_absolute_humidity;
    H3 = h_absolute_humidity;

    window.j_cathode_flow_rate = valueCoolerToSetGlobal(J1*1.2*(H3-J3)/1000);
    setValueSectionElement('j_cathode_flow_rate', valueCoolerToSetElement(j_cathode_flow_rate));
  });
  //Process air(J)

  //Dry air(K)
  //Get from Unit Selection

  //Post-cooler(L)
  $('#ac_atmospheric_pressure, #l_temperature, #k_absolute_humidity').change(function() {
    window.ac_atmospheric_pressure = convert_comma_to_dot($('#ac_atmospheric_pressure').val());
    window.l_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#l_temperature').val()));
    window.k_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#k_absolute_humidity').val()));

    setAbsoluteHumidity('ac_atmospheric_pressure', 'k_absolute_humidity', 'l_temperature', 'l_absolute_humidity');
  });

  $('#l_flow_rate, #l_temperature, #l_absolute_humidity, #k_temperature, #k_absolute_humidity').change(function() {
    window.l_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#l_flow_rate').val()));
    window.l_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#l_temperature').val()));
    window.l_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#l_absolute_humidity').val()));
    window.k_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#k_temperature').val()));
    window.k_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#k_absolute_humidity').val()));

    L1 = l_flow_rate;
    L2 = l_temperature;
    L3 = l_absolute_humidity;
    K2 = k_temperature;
    K3 = k_absolute_humidity;

    window.l_cathode_capacity = valueCoolerToSetGlobal(L1*1.2/3600*(K2+K3/1000*(2500+1.86*K2)-(L2+L3/1000*(2500+1.86*L2))));
    setValueSectionElement('l_cathode_capacity', valueCoolerToSetElement(l_cathode_capacity));
  });

  //Mixed air1(D)
  //d2
  $('#l_temperature, #c_flow_rate, #h_temperature').change(function() {
    window.l_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#l_temperature').val()));
    window.c_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#c_flow_rate').val()));
    window.h_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#h_temperature').val()));

    setDTemperatureValue();
  });

  //d3
  $('#l_absolute_humidity, #c_flow_rate, #h_absolute_humidity').change(function() {
    window.l_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#l_absolute_humidity').val()));
    window.c_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#c_flow_rate').val()));
    window.h_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#h_absolute_humidity').val()));

    setDAbsoluteHumidityValue();
  });

  //Supply air: SA(E)
  $('#e_temperature_display').change(function() {
    var e_temperature_display = $('#e_temperature_display').val();
    $('#e_temperature').val(e_temperature_display).trigger('change');
    window.e_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#e_temperature').val()));
  });

  $('#ac_atmospheric_pressure, #e_temperature, #d_absolute_humidity').change(function() {
    window.ac_atmospheric_pressure = convert_comma_to_dot($('#ac_atmospheric_pressure').val());
    window.e_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#e_temperature').val()));
    window.d_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#d_absolute_humidity').val()));

    setAbsoluteHumidity('ac_atmospheric_pressure', 'd_absolute_humidity', 'e_temperature', 'e_absolute_humidity');
  });

  $('#ac_supply_air_sa, #d_temperature, #d_absolute_humidity, #e_temperature, #e_absolute_humidity').change(function() {
    window.ac_supply_air_sa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_supply_air_sa').val()));
    window.d_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#d_temperature').val()));
    window.d_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#d_absolute_humidity').val()));
    window.e_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#e_temperature').val()));
    window.e_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#e_absolute_humidity').val()));

    setAdditionESectionElement();
  });

  $('#p_absolute_humidity, #k_flow_rate, #s_flow_rate, #j_absolute_humidity, #k_absolute_humidity').change(function() {
    window.p_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#p_absolute_humidity').val()));
    window.k_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#k_flow_rate').val()));
    window.s_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#s_flow_rate').val()));
    window.j_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#j_absolute_humidity').val()));
    window.k_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#k_absolute_humidity').val()));

    P3 = p_absolute_humidity;
    K1 = k_flow_rate;
    S1 = s_flow_rate;
    J3 = j_absolute_humidity;
    K3 = k_absolute_humidity;

    window.s_absolute_humidity = P3 + K1/S1*(J3 - K3);
    setValueSectionElement('s_absolute_humidity', valueAbsoluteHumidityToSetElement(s_absolute_humidity));
  });

  //fill to readonly block r, f, m, a, s, e
  $.each(['r', 'f', 'm', 'a', 's', 'e'], function(index, section) {
    $(`#${section}_flow_rate`).change(function() {
      $(`#readonly_${section}_flow_rate`).val(toFixedValue(convert_comma_to_dot($(`#${section}_flow_rate`).val())));
    });

    $(`#${section}_temperature`).change(function() {
      $(`#readonly_${section}_temperature`).val(toFixedValue(convert_comma_to_dot($(`#${section}_temperature`).val())));
    });

    $(`#${section}_absolute_humidity`).change(function() {
      $(`#readonly_${section}_absolute_humidity`).val(toFixedValue(convert_comma_to_dot($(`#${section}_absolute_humidity`).val())));
    });

    $('#readonly_s_temperature').val('Not given');
  });

  $('#air_mix_preview_print_btn').click(function() {
    if ($('table tr[class=selected]').length == 1) {
      $('#air_mixture_calculation_mode').val(calculation_mode);
      $('#form-preview-and-print').submit();
    } else {
      $('#modal_require_select_result').modal('show');
    }
  });

  $('#data-rows').on('click', 'tr', function() {
    $('#air_mixture_input_id').val($(this).data('air-mixture-input-id'));
    $('#project_name').val($('#air_mixture_project_name').val());
    $('#project_date').val($('#air_mixture_datetimepicker').val());
  });

  $('#l_temperature').change(function() {
    window.l_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#l_temperature').val()));

    $('#l_temperature').attr('l_temperature_input', true);
  });

  $('#e_temperature_display').change(function() {
    $('#e_temperature').attr('e_temperature_input', true);
  });

  $('#air_mixture_start_calculation').click(function() {
    unit_valid = $('#air_mixture_unit_id').valid();
    category_valid = $('#air_mixture_category_id').valid();
    supply_air_sa_valid = $("#ac_supply_air_sa").valid();
    outside_air_oa_show_valid = $("#ac_outside_air_oa_show").valid();
    height_above_sea_level_valid = $('#height_above_sea_level').valid();
    water_temperature_in_valid = $("#ac_water_temperature_in").valid();
    water_temperature_out_valid = $("#ac_water_temperature_out").valid();
    hot_water_out_valid = $("#hot_water_out").valid();
    hot_water_in_valid = $("#hot_water_in").valid();
    r_flow_rate_valid = $("#r_flow_rate").valid();
    f_temperature_valid = $("#f_temperature").valid();
    f_absolute_humidity_valid = $("#f_absolute_humidity").valid();
    a_temperature_valid = $("#a_temperature").valid();
    a_absolute_humidity_valid = $("#a_absolute_humidity").valid();
    n_temperature_valid = $("#n_temperature").valid();
    g_temperature_valid = $("#g_temperature").valid();
    j_temperature_valid = $("#j_temperature_display").valid();
    l_temperature_valid = $("#l_temperature").valid();
    e_temperature_valid = $("#e_temperature_display").valid();
    is_valid_textbox2 = $("#textbox2").valid();
    is_valid_textbox50 = $("#textbox50").valid();

    if(!(supply_air_sa_valid && outside_air_oa_show_valid && height_above_sea_level_valid && 
      water_temperature_in_valid && water_temperature_out_valid && r_flow_rate_valid && f_temperature_valid && f_absolute_humidity_valid && 
      a_temperature_valid && a_absolute_humidity_valid && n_temperature_valid && g_temperature_valid && j_temperature_valid && l_temperature_valid &&
      e_temperature_valid && hot_water_out_valid && hot_water_in_valid)) {

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

    if(!(unit_valid && category_valid && is_valid_textbox2 && is_valid_textbox50)) { return; }

    $.LoadingOverlay("show");

    let dataAirMixture = new FormData();
    data_input_hash = {air_mixture_input: {}};
    $.each(['r', 'f', 'm', 'a', 'n', 'g', 'h', 'p', 'j', 'c', 'k', 'l', 'd', 'e', 's'], function(index, section) {
      data_input_hash['air_mixture_input'][`${section}_flow_rate`] = window[`${section}_flow_rate`];
      data_input_hash['air_mixture_input'][`${section}_temperature`] = window[`${section}_temperature`];
      data_input_hash['air_mixture_input'][`${section}_absolute_humidity`] = window[`${section}_absolute_humidity`];
    });

    if ($('#l_temperature').attr('l_temperature_input') == 'true') {
      data_input_hash['air_mixture_input']['l_temperature'] = window['l_temperature'];
    } else {
      data_input_hash['air_mixture_input']['l_temperature'] = '';
    }

    if ($('#e_temperature').attr('e_temperature_input') == 'true') {
      data_input_hash['air_mixture_input']['e_temperature'] = window[`e_temperature`];
    } else {
      data_input_hash['air_mixture_input']['e_temperature'] = '';
    }

    //For calculation in UnitSelection - get value exactly value in view
    $.each(['p', 'j'], function(index, section) {
      data_input_hash['air_mixture_input'][`${section}_flow_rate_display`] = convert_comma_to_dot($(`#${section}_flow_rate_display`).text());
      data_input_hash['air_mixture_input'][`${section}_absolute_humidity_display`] = convert_comma_to_dot($(`#${section}_absolute_humidity_display`).text());
    });
    data_input_hash['air_mixture_input'][`p_temperature_display`] = convert_comma_to_dot($(`#p_temperature_display`).text());
    data_input_hash['air_mixture_input'][`j_temperature_display`] = convert_comma_to_dot($(`#j_temperature_display`).val());
    //

    $.each(['supply_air_sa', 'outside_air_oa', 'atmospheric_pressure', 'water_temperature_in', 'water_temperature_out'], function(index, ac_section) {
      data_input_hash['air_mixture_input'][`${ac_section}`] = window[`ac_${ac_section}`];
    });

    //Tab summary
    $.each(['height_above_sea_level', 'hot_water_in', 'hot_water_out', 'total_cooling_power', 'total_cooling_water_flow', 'total_heater_power',
      'total_hot_water_flow', 'room_capacity', 'correspondes_to', 'temp_difference_SA_and_RA', 'textbox2', 'textbox50'], function(index, field) {
        data_input_hash['air_mixture_input'][`${field}`] = window[`${field}`];
    });

    //Addition value
    $.each(['n_cathode_capacity', 'n_cathode_flow_rate', 'g_anode_capacity',
      'g_cathode_capacity', 'g_cathode_flow_rate', 'j_cathode_capacity',
      'j_cathode_flow_rate', 'l_cathode_capacity', 'e_anode_capacity',
      'e_cathode_capacity'], function(index, section) {
      data_input_hash['air_mixture_input'][`${section}`] = window[`${section}`];
    });

    data_input_hash['air_mixture_input']['m_unit_id'] = $('#air_mixture_unit_id').val();
    data_input_hash['air_mixture_input']['m_category_id'] = $('#air_mixture_category_id').val();
    data_input_hash['air_mixture_input']['heater_select'] = $('#air_mixture_inputs input[name=heater_select]:checked').val();
    var air_mixture_calculation_mode = (calculation_mode == true) ? "si" : "ip";
    data_input_hash['air_mixture_input']['calculation_mode'] = air_mixture_calculation_mode;

    dataAirMixture.append('air_mixture_input', JSON.stringify(data_input_hash['air_mixture_input']));

    Rails.ajax({
      url: '/air_mixtures',
      type: 'POST',
      data: dataAirMixture,
      dataType: 'script',
      success: function(data) {
        $.LoadingOverlay("hide");
      },
      error: function(data) {
        $.LoadingOverlay("hide");
      }
    });

  });

  $('#save-air-mixture-project').click(function() {
    if($('.choosen-result-cb:checked').length > 0) {
      $("#save-air-mixture-project-hide").trigger('click');
    } else {
      $('#modal_choose_result_alert').modal('show');
    }
  });

  $('#n_cathode_capacity, #g_cathode_capacity, #l_cathode_capacity, #e_anode_capacity, #j_cathode_capacity').change(function() {
    window.n_cathode_capacity = valueCoolerToSetGlobal(convert_comma_to_dot($('#n_cathode_capacity').val()));
    window.g_cathode_capacity = valueCoolerToSetGlobal(convert_comma_to_dot($('#g_cathode_capacity').val()));
    window.l_cathode_capacity = valueCoolerToSetGlobal(convert_comma_to_dot($('#l_cathode_capacity').val()));
    window.e_cathode_capacity = valueCoolerToSetGlobal(convert_comma_to_dot($('#e_cathode_capacity').val()));
    window.j_cathode_capacity = valueCoolerToSetGlobal(convert_comma_to_dot($('#j_cathode_capacity').val()));

    window.total_cooling_power = n_cathode_capacity + g_cathode_capacity + l_cathode_capacity + e_anode_capacity + j_cathode_capacity;
    setValueSectionElement('total_cooling_power', valueCoolerToSetElement(total_cooling_power));
  });

  $('#g_anode_capacity, #e_cathode_capacity').change(function() {
    window.g_anode_capacity = valueHeaterPowerToSetGlobal(convert_comma_to_dot($('#g_anode_capacity').val()));
    window.e_cathode_capacity = valueCoolerToSetGlobal(convert_comma_to_dot($('#e_cathode_capacity').val()));

    window.total_heater_power = g_anode_capacity + e_cathode_capacity;
    setValueSectionElement('total_heater_power', valueCoolerToSetElement(total_heater_power));
  });

  $('#total_heater_power, #hot_water_in, #hot_water_out').change(function() {
    window.total_heater_power = valueCoolerToSetGlobal(convert_comma_to_dot($('#total_heater_power').val()));
    window.hot_water_in = valueTemperatureToSetGlobal(convert_comma_to_dot($('#hot_water_in').val()));
    window.hot_water_out = valueTemperatureToSetGlobal(convert_comma_to_dot($('#hot_water_out').val()));

    window.total_hot_water_flow = Math.max(0, total_heater_power / ((273 + hot_water_in) - (273 + hot_water_out)) / 4.18);
    //Not IP mode
    setValueSectionElement('total_hot_water_flow', valueWaterFlowToSetElement(total_hot_water_flow));
  });

  $('#e_flow_rate, #a_absolute_humidity, #e_absolute_humidity').change(function() {
    window.e_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#e_flow_rate').val()));
    window.a_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#a_absolute_humidity').val()));
    window.e_absolute_humidity = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($('#e_absolute_humidity').val()));

    window.room_capacity = e_flow_rate * 1.2 * (a_absolute_humidity - e_absolute_humidity) / 1000;
    setValueSectionElement('room_capacity', valueHeaterPowerToSetElement(room_capacity));
  });

  $('#room_capacity').change(function() {
    window.room_capacity = valueHeaterPowerToSetGlobal(convert_comma_to_dot($('#room_capacity').val()));
    window.correspondes_to = room_capacity * 0.683;

    setValueSectionElement('correspondes_to', valueCoolerToSetElement((correspondes_to)));
  });

  $('#e_flow_rate, #a_temperature, #e_temperature').change(function() {
    window.e_flow_rate = valueFlowRateToSetGlobal(convert_comma_to_dot($('#e_flow_rate').val()));
    window.a_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#a_temperature').val()));
    window.e_temperature = valueTemperatureToSetGlobal(convert_comma_to_dot($('#e_temperature').val()));

    window.temp_difference_SA_and_RA = e_flow_rate * (a_temperature - e_temperature) / 3000 * 1.01;
    setValueSectionElement('temp_difference_SA_and_RA', valueCoolerToSetElement(temp_difference_SA_and_RA));
  });

  $('#total_cooling_power, #ac_water_temperature_in, #ac_water_temperature_out').change(function(event) {
    window.total_cooling_power = valueCoolerToSetGlobal(convert_comma_to_dot($('#total_cooling_power').val()));
    window.ac_water_temperature_in = valueTemperatureToSetGlobal(convert_comma_to_dot($('#ac_water_temperature_in').val()));
    window.ac_water_temperature_out = valueTemperatureToSetGlobal(convert_comma_to_dot($('#ac_water_temperature_out').val()));

    window.total_cooling_water_flow = calculationTotalCoolingWaterFlow();
    //Not IP mode
    setValueSectionElement('total_cooling_water_flow', valueWaterFlowToSetElement(total_cooling_water_flow));
  });

  $('input[type=radio][name=heater_select]').change(function() {
    heater_select_type = $("input[name=heater_select]:checked").val();
    if (heater_select_type == "8") {
      $('#textbox2').prop('disabled', false);
      $('#textbox50').prop('disabled', true);
    } else if (heater_select_type == "9") {
      $('#textbox2').prop('disabled', true);
      $('#textbox50').prop('disabled', false);
    }
  });
});

function choosenUnit(unit_id) {
  $('#air_mixture_unit_id').val(unit_id);
  window.selected_model = $('#item-units').find('[data-id=' + unit_id + ']');

  window.m_unit_dry_air = valueFlowRateToSetGlobal(parseFloat(selected_model.attr('data-dry-air')));
  window.m_unit_wet_air = valueFlowRateToSetGlobal(parseFloat(selected_model.attr('data-wet-air')));
  window.m_unit_capacity = valueHeaterPowerToSetGlobal(parseFloat(selected_model.attr('data-capacity')));
  window.m_special_wet_air = parseFloat((special_model_name.includes(selected_model.attr('data-model-name')) ? 0 : m_unit_wet_air));
  window.m_special_dry_air = parseFloat((special_model_name.includes(selected_model.attr('data-model-name')) ? (m_unit_dry_air + m_unit_wet_air) : m_unit_dry_air));

  //set flow rate for p1, j1, l1, c1
  window.p_flow_rate = m_special_wet_air;
  window.j_flow_rate = m_special_dry_air;
  window.l_flow_rate = m_unit_dry_air;

  setValueSectionElement('p_flow_rate', valueFlowRateToSetElement(m_special_wet_air));
  setValueSectionElement('j_flow_rate', valueFlowRateToSetElement(m_special_dry_air));
  setValueSectionElement('l_flow_rate', valueFlowRateToSetElement(m_unit_dry_air));

  window.ac_supply_air_sa = valueFlowRateToSetGlobal(convert_comma_to_dot($('#ac_supply_air_sa').val()));

  if (!$.isNumeric($('#ac_outside_air_oa_show').val())) {
    window.ac_outside_air_oa = ac_supply_air_sa * 0.1;
  }

  window.a_flow_rate = m_special_dry_air - m_unit_dry_air + ac_supply_air_sa - ac_outside_air_oa;
  setValueSectionElement('a_flow_rate', valueFlowRateToSetElement(a_flow_rate));

  window.c_flow_rate = ac_supply_air_sa - m_unit_dry_air;
  window.s_flow_rate = m_unit_wet_air;

  setValueSectionElement('c_flow_rate', valueFlowRateToSetElement(c_flow_rate));
  setValueSectionElement('s_flow_rate', valueFlowRateToSetElement(m_unit_wet_air));

  //set d2, d3, m2, n2, p2
  setDTemperatureValue();
  setDAbsoluteHumidityValue();
  setMNFlowRateValue();
  setPTemperature();
  setPAbsoluteHumidity();
}

function setDTemperatureValue() {
  if (typeof m_unit_dry_air != 'undefined') {
    var L2 = l_temperature;
    var C1 = c_flow_rate;
    var H2 = h_temperature;

    window.d_temperature = (m_unit_dry_air * L2 + C1 * H2) / (m_unit_dry_air + C1);
    window.e_temperature = d_temperature;
    setValueSectionElement('d_temperature', valueTemperatureToSetElement(d_temperature));

    if($('#l_temperature').val() == '' && !Number.isNaN(C1) && !Number.isNaN(H2)) {
      $('#e_temperature').val('').trigger('change');
      $('#e_temperature_display').val('');
      $('#e_temperature_display').blur();
    } else {
      setInputDisplayElement('e_temperature', valueTemperatureToSetElement(d_temperature));
    }
  };
}

// Q9 = MAX(Q8 / ((273 + P9) - (273 + O9)) / 4.18, 0)
function calculationTotalCoolingWaterFlow() {
  return Math.max(0, total_cooling_power / ((273 + ac_water_temperature_out) 
    - (273 + ac_water_temperature_in)) / 4.18);
}

function setDAbsoluteHumidityValue() {
  if (typeof m_unit_dry_air != 'undefined') {
    var L3 = l_absolute_humidity;
    var C1 = c_flow_rate;
    var H3 = h_absolute_humidity;
    
    window.d_absolute_humidity = (m_unit_dry_air * L3 + C1 * H3) / (m_unit_dry_air + C1);
    setValueSectionElement('d_absolute_humidity', valueAbsoluteHumidityToSetElement(d_absolute_humidity));
  };
};

function setMNFlowRateValue() {
  //n2 = m2
  if (typeof m_special_wet_air != 'undefined') {
    window.m_flow_rate = m_special_wet_air - r_flow_rate;
    window.n_flow_rate = m_flow_rate;
    setValueSectionElement('m_flow_rate', valueFlowRateToSetElement(m_flow_rate));
    setValueSectionElement('n_flow_rate', valueFlowRateToSetElement(m_flow_rate));
  }
};

function setAdditionESectionElement() {
  AC1 = ac_supply_air_sa;
  D2 = d_temperature;
  D3 = d_absolute_humidity;
  E2 = e_temperature;
  E3 = e_absolute_humidity;

  window.e_anode_capacity = valueCoolerToSetGlobal(Math.max(AC1*1.2/3600*(D2+D3/1000*(2500+1.86*D2)-(E2+E3/1000*(2500+1.86*E2))),0));
  setValueSectionElement('e_anode_capacity', valueCoolerToSetElement(e_anode_capacity));
  window.e_cathode_capacity = valueCoolerToSetGlobal(Math.max(AC1/3000*(E2-D2+D3/1000*1.86*(E2-D2)),0));
  setValueSectionElement('e_cathode_capacity', valueCoolerToSetElement(e_cathode_capacity));
};

function setPTemperature() {
  if (typeof m_special_wet_air != 'undefined') {
    if (m_special_wet_air == 0) {
      window.p_temperature = h_temperature;
    } else {
      var R1 = r_flow_rate;
      var R2 = r_temperature;
      var M1 = m_flow_rate;
      var N2 = n_temperature;
      window.p_temperature = (R1*R2+M1*N2)/(R1+M1);
    }
    setValueSectionElement('p_temperature', valueTemperatureToSetElement(p_temperature));
  };
};

function setPAbsoluteHumidity() {
  if (typeof m_special_wet_air != 'undefined') {
    if (m_special_wet_air == 0) {
      window.p_absolute_humidity = j_absolute_humidity;
    } else {
      var R1 = r_flow_rate;
      var R2 = r_temperature;
      var M1 = m_flow_rate;
      var N3 = n_absolute_humidity;
      window.p_absolute_humidity = (R1*R2+M1*N3)/(R1+M1);
    }
    setValueSectionElement('p_absolute_humidity', valueAbsoluteHumidityToSetElement(p_absolute_humidity));
  };
};

function setAbsoluteHumidity(AC_element, ab_humi_element, temp_element, set_element) {
  window[`${AC_element}`] = valueFlowRateToSetGlobal(convert_comma_to_dot($(`#${AC_element}`).val()));
  window[`${ab_humi_element}`] = valueAbsoluteHumidityToSetGlobal(convert_comma_to_dot($(`#${ab_humi_element}`).val()));
  window[`${temp_element}`] = valueTemperatureToSetGlobal(convert_comma_to_dot($(`#${temp_element}`).val()));

  AC = window[`${AC_element}`];
  ab_humi = window[`${ab_humi_element}`];
  temp  = window[`${temp_element}`]

  if (622/(AC/Math.exp(12.03-4025/(temp+235))/10/100 -1) < ab_humi) {
    var element_absolute_humidity = 622/(AC/Math.exp(12.03-4025/(temp+235))/10/100-1);
  } else {
    var element_absolute_humidity = ab_humi;
  }

  window[`${set_element}`] = valueAbsoluteHumidityToSetGlobal(element_absolute_humidity);
  setValueSectionElement(set_element, valueAbsoluteHumidityToSetElement(element_absolute_humidity));
};
