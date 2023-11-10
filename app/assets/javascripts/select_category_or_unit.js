$(document).ready(function () {
  category_init = $('.item-categories').children().first().data('name');
  $('#category').val($('.item-categories').children().first().data('key-name'));
  if($('#unit-selections-page').length > 0) {
    var area = $('#unit-selections-page').data('area');
    var unit_init = area == 'asia' ? 'RLA-60R' : 'RL-60R';
    $('#unit').val(unit_init);
    var history_change = $("#unit_selection_history_change").val();
    var new_history_change = history_change + 'combobox2' + ':' + category_init + '\n' + 'combobox8' + ':' + unit_init + '\n' + 'radiobutton10:true\ncheckbox4:false\n';
    $("#unit_selection_history_change").val(new_history_change);
  }

  $('.choose_category').html(category_init).addClass('color_green');

  if ($('#unit-selections-page').length > 0) {
    $('.choose_units').html(unit_init).addClass('color_green');
    var category = $('#category').val();
    var history_change = $("#unit_selection_history_change").val();
    $.ajax({
      type: "POST",
      url: $("#form-select-category-unit").attr("action"),
      data: {history_change: history_change, category: category},
      dataType: "script",
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      cache: false
    });
  }

  $('.item-categories a').click(function () {
    $('#category').val($(this).data('key-name'));
    $('.choose_units').html('+ Choose one').removeClass('color_green');
    $('#unit').val('');

    if($('#unit-selections-page').length > 0) {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'combobox2' + ':' + $(this).data('name') + '\n';
      $("#unit_selection_history_change").val(new_history_change);
    }

    var category = $('#category').val();
    var unit = $("#unit").val();
    var history_change = $("#unit_selection_history_change").val();
    $.ajax({
      type: "POST",
      url: $("#form-select-category-unit").attr("action"),
      data: {history_change: history_change, category: category, unit: unit, unit_selection_input_id: $('#current_unit_selection_input_id').val()},
      dataType: "script",
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      cache: false
    });

  });

  $('.item-units').on('click', 'a', function() {
    $('.choose_units').html($(this).text()).addClass('color_green');
    $('#unit').val($(this).data('name'));

    if($('#unit-selections-page').length > 0) {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'combobox8' + ':' + $(this).data('name') + '\n';
      $("#unit_selection_history_change").val(new_history_change);
    }

    var category = $('#category').val();
    var unit = $("#unit").val();
    var history_change = $("#unit_selection_history_change").val();
    $.ajax({
      type: "POST",
      url: $("#form-select-category-unit").attr("action"),
      data: {history_change: history_change, category: category, unit: unit, unit_selection_input_id: $('#current_unit_selection_input_id').val()},
      dataType: "script",
      headers: {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      },
      cache: false
    });
  });
});
