$(document).ready(function() {

  var c2_a1_fields = ['textbox81', 'textbox82', 'textbox76', 'textbox60', 'textbox61', 'textbox80', 'textbox87', 'textbox86', 'textbox85', 'textbox59', 'textbox58', 'textbox88'];

  $("#unit-selections-page").on('keyup', '#textbox81, #textbox82, #textbox76, #textbox60, #textbox61, #textbox80, #textbox87, #textbox86, #textbox85, #textbox59, #textbox58, #textbox88, [data-id=textbox81], [data-id=textbox82], [data-id=textbox76], [data-id=textbox60], [data-id=textbox61], [data-id=textbox80], [data-id=textbox87], [data-id=textbox86], [data-id=textbox85], [data-id=textbox59], [data-id=textbox58], [data-id=textbox88]', function(){
    var value =  /^[+-]?\d+((\.|\,)\d+)?$/.test($(this).val()) ? convert_comma_to_dot($(this).val()) : $(this).val();
    if ( typeof $(this).attr("data-id") === 'undefined') {
      var textbox_name = $(this).attr("id");
    }else{
      var textbox_name = $(this).attr("data-id").length > 0 ? $(this).attr("data-id") : $(this).attr("id");
    }

    var history_change = $("#unit_selection_history_change").val();
    var new_history_change = history_change + textbox_name + ':' + value + '\n';
    $("#unit_selection_history_change").val(new_history_change);
  });

  $("#unit-selections-page").on('change', '#image-container input.inp_table_gr' ,function(){
    var refected_element = $(`#${$(this).data('id')}`);
    if(refected_element.length > 0) {
      refected_element.val($(this).val()).trigger('change');
    }
  });

  $("#unit-selections-page").on('change', '#pills-tabContent input[type=text]' ,function(){
    var value =  /^[+-]?\d+((\.|\,)\d+)?$/.test($(this).val()) ? convert_comma_to_dot($(this).val()) : $(this).val();
    var textbox_name = $(this).attr("id");
    var category = $(".choose_category").text();
    var unit = $("#unit").val();
    var history_change = $("#unit_selection_history_change").val();
    if(!c2_a1_fields.includes($(this).attr('id'))) {
      var new_history_change = history_change + textbox_name + ':' + value + '\n';
      $("#unit_selection_history_change").val(new_history_change);
    } else {
      var new_history_change = history_change;
    }
if(!(value === "" && c2_a1_fields.includes($(this).attr('id'))) && (value === "" || !(/^[+-]?\d+((\.|\,)\d+)?$/.test(value.toString())))){return;}
    $.ajax({
      type: "POST",
      url: "/unit_selection/change_values",
      data: {history_change: new_history_change, unit_selection_input_id: $('#current_unit_selection_input_id').val()},
      dataType: "script",
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      cache: false
    });
  });

  $("body").on('change', "#textbox66", function() {
    var value = /^[+-]?\d+((\.|\,)\d+)?$/.test($(this).val()) ? convert_comma_to_dot($(this).val()) : $(this).val();
    $('input.inp_table_gr[data-id=textbox66]').val(value);
    $('#modal_cal #textbox66').val(value);
    var textbox_name = $(this).attr("id");
    var history_change = $("#unit_selection_history_change").val();
    var new_history_change = history_change + textbox_name + ':' + value + '\n';
    $("#unit_selection_history_change").val(new_history_change);
    if(value === "" || !(/^[+-]?\d+((\.|\,)\d+)?$/.test(value.toString()))){return;}
    $.ajax({
      type: "POST",
      url: "/unit_selection/change_values",
      data: {history_change: new_history_change, unit_selection_input_id: $('#current_unit_selection_input_id').val()},
      dataType: "script",
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      cache: false
    });
  });

  $("#bonus_unit_selection_start_calculation").on("click", function(){
    $("#unit_selection_start_calculation").click();
  });

  $("#unit_selection_start_calculation").on("click", function(){
    textbox1 = true;
    textbox2 = true;
    textbox7 = true;
    textbox10 = true;
    textbox19 = true;
    textbox23 = true;
    textbox38 = true;
    textbox50 = true;
    textbox60 = true;
    textbox61 = true;
    textbox65 = true;
    textbox80 = true;
    textbox29 = true;
    textbox30 = true;
    textbox31 = true;
    textbox32 = true;
    textbox34 = true;
    textbox47 = true;
    textbox48 = true;
    textbox49 = true;
    textbox58 = true;
    textbox59 = true;
    textbox83 = true;
    textbox88 = true;
    textbox79 = true;
    textbox78 = true;
    textbox76 = true;
    textbox81 = true;
    textbox82 = true;
    textbox85 = true;
    textbox86 = true;
    textbox87 = true;
    textbox77 = true;
    category = true;
    unit = true;

    if ($("#category").length) {
      category = $("#category").valid();
    };
    if ($("#unit").length) {
      unit = $("#unit").valid();
    };
    if ($("#textbox1").length) {
      textbox1 = $("#textbox1").valid();
    };
    if ($("#textbox2").length) {
      textbox2 = $("#textbox2").valid();
    };
    if ($("#textbox7").length) {
      textbox7 = $("#textbox7").valid();
    };
    if ($("#textbox10").length) {
      textbox10 = $("#textbox10").valid();
    };
    if ($("#textbox19").length) {
      textbox19 = $("#textbox19").valid();
    };
    if ($("#textbox23").length) {
      textbox23 = $("#textbox23").valid();
    };
    if ($("#textbox38").length) {
      textbox38 = $("#textbox38").valid();
    };
    if ($("#textbox50").length) {
      textbox50 = $("#textbox50").valid();
    };
    if ($("#textbox60").length) {
      textbox60 = $("#textbox60").valid();
    };
    if ($("#textbox61").length) {
      textbox61 = $("#textbox61").valid();
    };
    if ($("#textbox65").length) {
      textbox65 = $("#textbox65").valid();
    };
    if ($("#textbox80").length) {
      textbox80 = $("#textbox80").valid();
    };
    if ($("#textbox29").length) {
      textbox29 = $("#textbox29").valid();
    };
    if ($("#textbox30").length) {
      textbox30 = $("#textbox30").valid();
    };
    if ($("#textbox31").length) {
      textbox31 = $("#textbox31").valid();
    };
    if ($("#textbox32").length) {
      textbox32 = $("#textbox32").valid();
    };
    if ($("#textbox34").length) {
      textbox34 = $("#textbox34").valid();
    };
    if ($("#textbox47").length) {
      textbox47 = $("#textbox47").valid();
    };
    if ($("#textbox48").length) {
      textbox48 = $("#textbox48").valid();
    };
    if ($("#textbox49").length) {
      textbox49 = $("#textbox49").valid();
    };
    if ($("#textbox58").length) {
      textbox58 = $("#textbox58").valid();
    };
    if ($("#textbox59").length) {
      textbox59 = $("#textbox59").valid();
    };
    if ($("#textbox83").length) {
      textbox83 = $("#textbox83").valid();
    };
    if ($("#textbox88").length) {
      textbox88 = $("#textbox88").valid();
    };
    if ($("#textbox79").length) {
      textbox79 = $("#textbox79").valid();
    };
    if ($("#textbox78").length) {
      textbox78 = $("#textbox78").valid();
    };
    if ($("#textbox76").length) {
      textbox76 = $("#textbox76").valid();
    };
    if ($("#textbox81").length) {
      textbox81 = $("#textbox81").valid();
    };
    if ($("#textbox82").length) {
      textbox82 = $("#textbox82").valid();
    };
    if ($("#textbox85").length) {
      textbox85 = $("#textbox85").valid();
    };
    if ($("#textbox86").length) {
      textbox86 = $("#textbox86").valid();
    };
    if ($("#textbox87").length) {
      textbox87 = $("#textbox87").valid();
    };
    if ($("#textbox77").length) {
      textbox77 = $("#textbox77").valid();
    };


    if(!(textbox1 && textbox2 && textbox7 && textbox10 && textbox19 && textbox23 && textbox38 && textbox50 && textbox60 && textbox61 && textbox65 && textbox80 && textbox29 && textbox30 && textbox31 && textbox32 && textbox34 && textbox47 && textbox48 && textbox49 && textbox58 && textbox59 && textbox83 && textbox88 && textbox79 && textbox78 && textbox76 && textbox81 && textbox82 && textbox85 && textbox86 && textbox87 && textbox77)) {
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

    if(!unit) { return; }

    $.LoadingOverlay("show");
    var history_change = $("#unit_selection_history_change").val();
    var new_history_change = history_change;
    $("#unit_selection_history_change").val(new_history_change);
    var value = $(this).val();
    var textbox_name = $(this).attr("id");
    var category = $(".choose_category").text();
    var unit = $("#unit").val();

    $.ajax({
      type: "POST",
      url: "/unit_selection",
      data: {history_change: history_change, category: category, unit: unit, unit_selection_input_id: $('#current_unit_selection_input_id').val()},
      dataType: "script",
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      cache: false
    });
  });

  $('#save_project_unit_selection').on('click', function() {

    project_name_valid = $('#project_name_unit_selection').valid();
    date_of_project_valid = $('#unit_selection_datetimepicker').valid();

    if(!(project_name_valid && date_of_project_valid)) {
      return;
    }

    let dataProject = new FormData();
    data_input_hash = {project: {}};

    var unit_selection_result_ids = '_';

    if($('#unit_selection_calculation_results .choosen-result-cb:checked').length == 0){
      $('#modal_choose_result_alert_unit_selection_before_save').modal('show');
      return;
    }

    $.LoadingOverlay("show");

    $('#unit_selection_calculation_results').find('.choosen-result-cb:checked').each(function() {
      unit_selection_result_ids = unit_selection_result_ids + '_' + $(this).val();
    });

    data_input_hash['project']['calculation_type'] = 'unit_selection';
    data_input_hash['project']['name'] = $('#project_name_unit_selection').val();
    data_input_hash['project']['date_of_project'] = $('#unit_selection_datetimepicker').val();

    dataProject.append('project', JSON.stringify(data_input_hash['project']));
    dataProject.append('save_from_unit_selection', 'true');
    dataProject.append('unit_selection_result_ids', unit_selection_result_ids);

    Rails.ajax({
      url: '/projects',
      type: 'POST',
      data: dataProject,
      dataType: 'script',
      success: function(data) {
        $.LoadingOverlay("hide");
      },
      error: function(data) {
        $.LoadingOverlay("hide");
      }
    });
  });


  $('#excel_export_button').click(function() {
    if($('#data-rows-unit-selection').find("tr.selected").length == 0) {
      $('#modal_choose_result_alert_unit_selection').modal('show');
    };
  });

  $('#preview_and_print_button').click(function(event) {
    if($('#data-rows-unit-selection').find("tr.selected").length == 0) {
      event.preventDefault();
      $('#modal_choose_result_alert_unit_selection_before_preview').modal('show');
    };
  });

  $("#data-rows-unit-selection").on("click", "tr",  function(){
    var url = "/export_excel/unit_selections.xlsx" + "?id=" + $(this).attr("data-unit-selection-input-id");
    $("#excel_export_button").attr("href", url);
  });
});
