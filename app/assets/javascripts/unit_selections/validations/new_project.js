function new_unit_selection_project(){
  $.validator.addMethod('decimal', function(value, element) {
    return this.optional(element) || /(^[-+]?([0-9]+)+[,.]?([0-9]+)?)$/.test(value);
  }, "Please enter a correct number or decimal");

  $.validator.addMethod('max_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") <= param;
  });

  $.validator.addMethod('min_custom', function(value, element, param) {
    return this.optional(element) || value.replace(",", ".") >= param;
  });

  $('#infor_of_project').validate({
    ignore: ':disabled',
    rules:{
      'category':{
        required: true
      },
      'unit':{
        required: true
      },
      'name':{
        required: true,
        maxlength: 50
      },
      'date_of_project':{
        required: true
      },
      'textbox1': {
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      'textbox2': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 160
      },
      'textbox7': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50
      },
      'textbox10': {
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      'textbox19': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50
      },
      'textbox23': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox38': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox50': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox60': {
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      'textbox61': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50
      },
      'textbox65': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox80': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox29': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox30': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50*7
      },
      'textbox31': {
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      'textbox32': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox34': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 160*1.8+32
      },
      'textbox47': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50*7
      },
      'textbox48': {
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      'textbox49': {
        required: true,
        decimal: true,
        min_custom: 0,
      },
      'textbox58': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50*7
      },
      'textbox59': {
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      'textbox83': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox88': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox79': {
        decimal: true,
        min_custom: 0
      },
      'textbox78': {
        decimal: true,
        min_custom: 0
      },
      'textbox76': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox81': {
        required: true,
        decimal: true,
        min_custom: -100,
        max_custom: 100
      },
      'textbox82': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50
      },
      'textbox85': {
        required: true,
        decimal: true,
        min_custom: 0
      },
      'textbox86': {
        required: true,
        decimal: true,
        min_custom: 0,
        max_custom: 50*7
      },
      'textbox87': {
        required: true,
        decimal: true,
        min_custom: -100*1.8+32,
        max_custom: 100*1.8+32
      },
      'textbox77': {
        required: true,
        decimal: true,
        min_custom: -400,
        max_custom: 9000
      }
    },
    messages:{
      'category':{
        required: I18n.t('js.unit_selection.category_required')
      },
      'unit':{
        required: I18n.t('js.unit_selection.unit_required')
      },
      'name': {
        required: I18n.t('js.unit_selection.project_name_required'),
        maxlength: I18n.t('js.unit_selection.maxlength')
      },
      'date_of_project': {
        required: I18n.t('js.unit_selection.date_of_project_required'),
      },
      'textbox1': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred'),
        max_custom: I18n.t('js.unit_selection.max_100')
      },
      'textbox2': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_160')
      },
      'textbox7': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50')
      },
      'textbox10': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred'),
        max_custom: I18n.t('js.unit_selection.max_100')
      },
      'textbox19': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50')
      },
      'textbox23': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox38': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox50': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox60': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred'),
        max_custom: I18n.t('js.unit_selection.max_100')
      },
      'textbox61': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50')
      },
      'textbox65': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox80': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox29': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox30': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50_ip')
      },
      'textbox31': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred_ip'),
        max_custom: I18n.t('js.unit_selection.max_100_ip')
      },
      'textbox32': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox34': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_160_ip')
      },
      'textbox47': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50_ip')
      },
      'textbox48': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred_ip'),
        max_custom: I18n.t('js.unit_selection.max_100_ip')
      },
      'textbox49': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
      },
      'textbox58': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50_ip')
      },
      'textbox59': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred_ip'),
        max_custom: I18n.t('js.unit_selection.max_100_ip')
      },
      'textbox83': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox88': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox79': {
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox78': {
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox76': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox81': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred'),
        max_custom: I18n.t('js.unit_selection.max_100')
      },
      'textbox82': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50')
      },
      'textbox85': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0')
      },
      'textbox86': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_0'),
        max_custom: I18n.t('js.unit_selection.max_50_ip')
      },
      'textbox87': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_one_hundred_ip'),
        max_custom: I18n.t('js.unit_selection.max_100_ip')
      },
      'textbox77': {
        required: I18n.t('js.unit_selection.required'),
        decimal: I18n.t('js.unit_selection.decimal'),
        min_custom: I18n.t('js.unit_selection.min_negative_four_hundred'),
        max_custom: I18n.t('js.unit_selection.max_9000')
      }
    },
    errorPlacement: function(error, element) {
      var input_boders = ["textbox1", "textbox2", "textbox7", "textbox10", "textbox19", "textbox23", "textbox38", "textbox50", "textbox60", "textbox61", "textbox65", "textbox80", "textbox29", "textbox30", "textbox31", "textbox32", "textbox34", "textbox47", "textbox48", "textbox49", "textbox58", "textbox59", "textbox83", "textbox88", "textbox79", "textbox78", "textbox76", "textbox81", "textbox82", "textbox85", "textbox86", "textbox87", "textbox77"];
      if ($.inArray(element.attr('name'), input_boders) >= 0) {
        element.css('border-color', 'red');
        element.attr('title', error.text());
      }
      else {
        error.insertAfter(element);
      }
    }
  });
}

$(document).ready(function() {
  new_unit_selection_project();

  $('#textbox1, #textbox2, #textbox7, #textbox10, #textbox19, #textbox23, #textbox38, #textbox50, #textbox60, #textbox61, #textbox65, #textbox80, #textbox29, #textbox30, #textbox31, #textbox32, #textbox34, #textbox47, #textbox48, #textbox49, #textbox58, #textbox59, #textbox83, #textbox88, #textbox79, #textbox78, #textbox76, #textbox81, #textbox82, #textbox85, #textbox86, #textbox87, #textbox77').on('blur change', function() {
    if ($(this).valid()){
      $(this).removeAttr('title');
      $(this).css('border-color', '#707070');

      tab_pane_id = $(this).closest('.tab-pane').attr('id');
      if ($(`#${tab_pane_id} input.error.text-danger[type!=hidden]`).length == 0) {
        $(`.slick-slide .nav-link[href='#${tab_pane_id}']`).removeClass('error-tab');
      }
    };
  });
});
