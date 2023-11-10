function new_air_mixture_project_si(){
  $.validator.addMethod('decimal', function(value, element) {
    return this.optional(element) || /(^[-+]?([0-9]+)+[,.]?([0-9]+)?)$/.test(value);
  }, "Please enter a correct number or decimal");

  $.validator.addMethod('max_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") <= param;
  });

  $.validator.addMethod('min_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") >= param;
  });

  $.validator.addMethod('great_than_water_temperature_plus_3', function(value) {
    if (!Number.isNaN(value) && value != '') {
      return parseFloat(value) > ac_water_temperature_in + 3;
    } else {
      return true;
    }
  });

  $('.new-air-mixtures-project').validate({
    ignore: ':disabled',
    rules:{
      'm_unit_id':{
        required: true
      },
      'project[name]': {
        required: true,
        maxlength: 50
      },
      'textbox2': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 160
      },
      'textbox50': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'project[date_of_project]': {
        required: true,
      },
      'm_category_id': {
        required: true,
      },
      'supply_air_sa':{
        required: true,
        decimal: true,
        min_custom: 0
      },
      'outside_air_oa_show':{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "height_above_sea_level":{
        required: true,
        decimal: true,
        min_custom: -400,
        max_custom: 9000
      },
      "water_temperature_in":{
        required: true,
        decimal: true,
        min_custom: -50,
        max_custom: 50
      },
      "water_temperature_out":{
        required: true,
        decimal: true,
        min_custom: -50,
        max_custom: 50
      },
      "hot_water_in":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 300
      },
      "hot_water_out":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 300
      },
      "r_flow_rate":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "f_temperature":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      "f_absolute_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50
      },
      "a_temperature":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 100
      },
      "a_absolute_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50
      },
      "n_temperature":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100,
        great_than_water_temperature_plus_3: true
      },
      "g_temperature":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100,
        great_than_water_temperature_plus_3: true
      },
      "j_temperature_display":{
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100,
        great_than_water_temperature_plus_3: true
      },
      "l_temperature":{
        decimal: true,
        min_custom: -100,
        max_custom: 100,
        great_than_water_temperature_plus_3: true
      },
      "e_temperature_display":{
        decimal: true,
        min_custom: -100,
        max_custom: 100,
        great_than_water_temperature_plus_3: true
      }
    },
    messages:{
      'm_unit_id': {
        required: I18n.t('js.air_mixture.m_unit_id_required')
      },
      'project[name]': {
        required: I18n.t('js.air_mixture.project_name_required'),
        maxlength: I18n.t('js.air_mixture.maxlength')
      },
      'textbox2': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_160')
      },
      'textbox50': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'project[date_of_project]':{
        required: I18n.t('js.air_mixture.date_of_project_required'),
      },
      'm_category_id':{
        required: I18n.t('js.air_mixture.m_category_id_required'),
      },
      'supply_air_sa':{
        required: I18n.t('js.air_mixture.supply_air_sa'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0')
      },
      'outside_air_oa_show':{
        required: I18n.t('js.air_mixture.outside_air_oa'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0')
      },
      "height_above_sea_level":{
        required: I18n.t('js.air_mixture.drc_height_above_sea_level'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_four_hundred'),
        max_custom: I18n.t('js.air_mixture.max_9000')
      },
      "water_temperature_in":{
        required: I18n.t('js.air_mixture.water_temperature_in'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_fifty'),
        max_custom: I18n.t('js.air_mixture.max_50')
      },
      "water_temperature_out":{
        required: I18n.t('js.air_mixture.water_temperature_out'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_fifty'),
        max_custom: I18n.t('js.air_mixture.max_50')
      },
      "hot_water_in":{
        required: I18n.t('js.air_mixture.hot_water_in'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_300')
      },
      "hot_water_out":{
        required: I18n.t('js.air_mixture.hot_water_out'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_300')
      },
      "r_flow_rate":{
        required: I18n.t('js.air_mixture.r_flow_rate'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0')
      },
      "f_temperature":{
        required: I18n.t('js.air_mixture.f_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_one_hundred'),
        max_custom: I18n.t('js.air_mixture.max_100')
      },
      "f_absolute_humidity":{
        required: I18n.t('js.air_mixture.f_absolute_humidity'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_50')
      },
      "a_temperature":{
        required: I18n.t('js.air_mixture.a_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_100')
      },
      "a_absolute_humidity":{
        required: I18n.t('js.air_mixture.a_absolute_humidity'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_50')
      },
      "n_temperature":{
        required: I18n.t('js.air_mixture.n_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_one_hundred'),
        max_custom: I18n.t('js.air_mixture.max_100'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_n')
      },
      "g_temperature":{
        required: I18n.t('js.air_mixture.g_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_one_hundred'),
        max_custom: I18n.t('js.air_mixture.max_100'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_g')
      },
      "j_temperature_display":{
        required: I18n.t('js.air_mixture.j_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_one_hundred'),
        max_custom: I18n.t('js.air_mixture.max_100'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_j')
      },
      "l_temperature":{
        required: I18n.t('js.air_mixture.l_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_one_hundred'),
        max_custom: I18n.t('js.air_mixture.max_100'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_l')
      },
      "e_temperature_display":{
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_one_hundred'),
        max_custom: I18n.t('js.air_mixture.max_100'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_e')
      }
    },
    errorPlacement: function(error, element) {
      var input_boders = ["supply_air_sa", "outside_air_oa_show", "height_above_sea_level", "water_temperature_in", "water_temperature_out", "r_flow_rate", "f_temperature", "f_absolute_humidity", "a_temperature", "a_absolute_humidity", "n_temperature", "g_temperature", "j_temperature_display", "l_temperature", "e_temperature_display", "decimal", "hot_water_in", "hot_water_out", "textbox2", "textbox50"];
      if ($.inArray(element.attr("name"), input_boders) >= 0) {
        element.css("border-color", "red");
        element.attr("title", error.text());
      }
      else {
        error.insertAfter(element);
      }
    }
  });
}

function new_air_mixture_project_ip(){
  $.validator.addMethod('decimal', function(value, element) {
    return this.optional(element) || /(^[-+]?([0-9]+)+[,.]?([0-9]+)?)$/.test(value);
  }, "Please enter a correct number or decimal");

  $.validator.addMethod('max_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") <= param;
  });

  $.validator.addMethod('min_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") >= param;
  });

  $.validator.addMethod('great_than_water_temperature_plus_3', function(value) {
    if (!Number.isNaN(value) && value != '') {
      return parseFloat(value) > (ac_water_temperature_in + 3) * 1.8 + 32;
    } else {
      return true;
    }
  });

  $('.new-air-mixtures-project').validate({
    ignore: ':disabled',
    rules:{
      'm_unit_id':{
        required: true
      },
      'project[name]': {
        required: true,
        maxlength: 50
      },
      'textbox2': {
        required: true,
        decimal: true,
        min_custom: 32,
        max_custom: 320
      },
      'textbox50': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'project[date_of_project]': {
        required: true,
      },
      'm_category_id': {
        required: true,
      },
      'supply_air_sa':{
        required: true,
        decimal: true,
        min_custom: 0
      },
      'outside_air_oa_show':{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "height_above_sea_level":{
        required: true,
        decimal: true,
        min_custom: -400,
        max_custom: 9000
      },
      "water_temperature_in":{
        required: true,
        decimal: true,
        min_custom: -58,
        max_custom: 122
      },
      "water_temperature_out":{
        required: true,
        decimal: true,
        min_custom: -58,
        max_custom: 122
      },
      "hot_water_in":{
        required: true,
        decimal: true,
        min_custom: 32,
        max_custom: 572
      },
      "hot_water_out":{
        required: true,
        decimal: true,
        min_custom: 32,
        max_custom: 572
      },
      "r_flow_rate":{
        required: true,
        decimal: true,
        min_custom: 0
      },
      "f_temperature":{
        required: true,
        decimal: true,
        min_custom: -148,
        max_custom: 212
      },
      "f_absolute_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 350
      },
      "a_temperature":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 212
      },
      "a_absolute_humidity":{
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 350
      },
      "n_temperature":{
        required: true,
        decimal: true,
        min_custom: -148,
        max_custom: 212,
        great_than_water_temperature_plus_3: true
      },
      "g_temperature":{
        required: true,
        decimal: true,
        min_custom: -148,
        max_custom: 212,
        great_than_water_temperature_plus_3: true
      },
      "j_temperature_display":{
        required: true,
        decimal: true,
        min_custom: -148,
        max_custom: 212,
        great_than_water_temperature_plus_3: true
      },
      "l_temperature":{
        decimal: true,
        min_custom: -148,
        max_custom: 212,
        great_than_water_temperature_plus_3: true
      },
      "e_temperature_display":{
        decimal: true,
        min_custom: -148,
        max_custom: 212,
        great_than_water_temperature_plus_3: true
      }
    },
    messages:{
      'm_unit_id': {
        required: I18n.t('js.air_mixture.m_unit_id_required')
      },
      'project[name]': {
        required: I18n.t('js.air_mixture.project_name_required'),
        maxlength: I18n.t('js.air_mixture.maxlength')
      },
      'textbox2': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_160')
      },
      'textbox50': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'project[date_of_project]':{
        required: I18n.t('js.air_mixture.date_of_project_required')
      },
      'm_category_id':{
        required: I18n.t('js.air_mixture.m_category_id_required')
      },
      'supply_air_sa':{
        required: I18n.t('js.air_mixture.supply_air_sa'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0')
      },
      'outside_air_oa_show':{
        required: I18n.t('js.air_mixture.outside_air_oa'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0')
      },
      "height_above_sea_level":{
        required: I18n.t('js.air_mixture.drc_height_above_sea_level'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_negative_four_hundred'),
        max_custom: I18n.t('js.air_mixture.max_9000')
      },
      "water_temperature_in":{
        required: I18n.t('js.air_mixture.water_temperature_in'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_58'),
        max_custom: I18n.t('js.air_mixture.max_122')
      },
      "water_temperature_out":{
        required: I18n.t('js.air_mixture.water_temperature_out'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_58'),
        max_custom: I18n.t('js.air_mixture.max_122')
      },
      "hot_water_in":{
        required: I18n.t('js.air_mixture.hot_water_in'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_32'),
        max_custom: I18n.t('js.air_mixture.max_572')
      },
      "hot_water_out":{
        required: I18n.t('js.air_mixture.hot_water_out'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_32'),
        max_custom: I18n.t('js.air_mixture.max_572')
      },
      "r_flow_rate":{
        required: I18n.t('js.air_mixture.r_flow_rate'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0')
      },
      "f_temperature":{
        required: I18n.t('js.air_mixture.f_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_148'),
        max_custom: I18n.t('js.air_mixture.max_212')
      },
      "f_absolute_humidity":{
        required: I18n.t('js.air_mixture.f_absolute_humidity'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_350')
      },
      "a_temperature":{
        required: I18n.t('js.air_mixture.a_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_212')
      },
      "a_absolute_humidity":{
        required: I18n.t('js.air_mixture.a_absolute_humidity'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_0'),
        max_custom: I18n.t('js.air_mixture.max_350')
      },
      "n_temperature":{
        required: I18n.t('js.air_mixture.n_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_148'),
        max_custom: I18n.t('js.air_mixture.max_212'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_n')
      },
      "g_temperature":{
        required: I18n.t('js.air_mixture.g_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_148'),
        max_custom: I18n.t('js.air_mixture.max_212'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_g')
      },
      "j_temperature_display":{
        required: I18n.t('js.air_mixture.j_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_148'),
        max_custom: I18n.t('js.air_mixture.max_212'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_j')
      },
      "l_temperature":{
        required: I18n.t('js.air_mixture.l_temperature'),
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_148'),
        max_custom: I18n.t('js.air_mixture.max_212'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_l')
      },
      "e_temperature_display":{
        decimal: I18n.t('js.air_mixture.decimal'),
        min_custom: I18n.t('js.air_mixture.min_n_148'),
        max_custom: I18n.t('js.air_mixture.max_212'),
        great_than_water_temperature_plus_3: I18n.t('js.air_mixture.great_than_water_temperature_tab_e')
      }
    },
    errorPlacement: function(error, element) {
      var input_boders = ["supply_air_sa", "outside_air_oa_show", "height_above_sea_level", "water_temperature_in", "water_temperature_out", "r_flow_rate", "f_temperature", "f_absolute_humidity", "a_temperature", "a_absolute_humidity", "n_temperature", "g_temperature", "j_temperature_display", "l_temperature", "e_temperature_display", "decimal", "hot_water_in", "hot_water_out", "textbox2", "textbox50"];
      if ($.inArray(element.attr("name"), input_boders) >= 0) {
        element.css("border-color", "red");
        element.attr("title", error.text());
      }
      else {
        error.insertAfter(element);
      }
    }
  });
}

$(document).ready(function() {
  new_air_mixture_project_si();

  $('#air_mixture_project_name').on('change', function() {
    $(this).valid();
  });

  $("#ac_supply_air_sa, #ac_outside_air_oa_show, #height_above_sea_level, #ac_water_temperature_in, #ac_water_temperature_out, #r_flow_rate, #f_temperature, #f_absolute_humidity, #a_temperature, #a_absolute_humidity, #n_temperature, #g_temperature, #j_temperature_display, #l_temperature, #e_temperature_display, #decimal, #hot_water_in, #hot_water_out, #textbox2, #textbox50").on('blur change', function() {
    if ($(this).valid()){
      $(this).removeAttr("title");
      $(this).css("border-color", "#707070");
      $(this).css("color", "#1c1e1e");

      tab_pane_id = $(this).closest('.tab-pane').attr('id');
      if ($(`#${tab_pane_id} input.error.text-danger[type!=hidden]`).length == 0) {
        $(`.slick-slide .nav-link[href='#${tab_pane_id}']`).removeClass('error-tab');
      }
    };
  });
});
