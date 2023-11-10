$(document).ready(function() {
  if($('#unit-selections-page').length > 0) {
    $('#unit-selections-page').on('click', '#checkbox4, input[data-id=checkbox4]', function() {
      $('#checkbox4').prop('checked', $(this).is(':checked'));
      $('input[data-id=checkbox4]').prop('checked', $(this).is(':checked'));

      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'checkbox4' + ':' + `${$(this).is(':checked')}` + '\n';
      $("#unit_selection_history_change").val(new_history_change);  
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


    $('#unit-selections-page').on('click', '#checkbox6, input[data-id=checkbox6]', function() {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'checkbox6' + ':' + `${$(this).is(':checked')}` + '\n';
      $("#unit_selection_history_change").val(new_history_change);
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

    $('#unit-selections-page').on('click', '#checkbox19, input[data-id=checkbox19]', function() {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'checkbox19' + ':' + `${$(this).is(':checked')}` + '\n';
      $("#unit_selection_history_change").val(new_history_change);
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

    $('#unit-selections-page').on('click', '#checkbox23', function() {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'checkbox23' + ':' + `${$(this).is(':checked')}` + '\n';
      $("#unit_selection_history_change").val(new_history_change);
    });
  }
});
