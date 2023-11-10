$(document).ready(function() {
  if($('#unit-selections-page').length > 0) {
    $('#radiobutton8').click(function() {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'radiobutton8' + ':' + 'true' + '\n';
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


    $('#radiobutton9').click(function() {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'radiobutton9' + ':' + 'true' + '\n';
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


    $('#radiobutton5').click(function() {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'radiobutton5' + ':' + 'true' + '\n';
      $("#unit_selection_history_change").val(new_history_change);

      $.LoadingOverlay("show");
      var input_ids = [];
      if($('#data-rows-unit-selection tr').length > 0) {
        for(var i = 0; i < $('#data-rows-unit-selection tr').length; i++) {
          input_ids.push($('#data-rows-unit-selection tr').eq(i).data('unit-selection-input-id'));
        }
      }

      $.ajax({
        type: "POST",
        url: "/unit_selection/change_values",
        data: {history_change: new_history_change, unit_selection_input_id: $('#current_unit_selection_input_id').val(), input_ids: input_ids},
        dataType: "script",
        headers: {
          'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
        },
        cache: false,
        success: function() {
          $.LoadingOverlay("hide");
        },
        error: function() {
          $.LoadingOverlay("hide");
        }
      });
    });

    $('#radiobutton6').click(function() {
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'radiobutton6' + ':' + 'true' + '\n';
      $("#unit_selection_history_change").val(new_history_change);

      $.LoadingOverlay("show");
      var input_ids = [];
      if($('#data-rows-unit-selection tr').length > 0) {
        for(var i = 0; i < $('#data-rows-unit-selection tr').length; i++) {
          input_ids.push($('#data-rows-unit-selection tr').eq(i).data('unit-selection-input-id'));
        }
      }

      $.ajax({
        type: "POST",
        url: "/unit_selection/change_values",
        data: {history_change: new_history_change, unit_selection_input_id: $('#current_unit_selection_input_id').val(), input_ids: input_ids},
        dataType: "script",
        headers: {
          'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
        },
        cache: false,
        success: function() {
          $.LoadingOverlay("hide");
        },
        error: function() {
          $.LoadingOverlay("hide");
        }
      });
    });

    $('#unit-selections-page').on('click', '[name=humidity_select]', function() {
      units_not_applied_humidity_select = ["DR-010 B", "DR-20B", "DR-30D", "DR-40-T10", "DR-40-T16", "DR-50 R", "DR-31 T10", "CS-5", "CS-5L"];
      if(units_not_applied_humidity_select.includes($('input#unit').val())) {
        if($('#radiobutton10').is(':checked')) {
          var history_change = $("#unit_selection_history_change").val();
          var new_history_change = history_change + 'radiobutton10:true\n';
          $("#unit_selection_history_change").val(new_history_change);
          $('#textbox30, [data-id=textbox30], [data-id=textbox82], #textbox82, [data-id=textbox86], #textbox61, [data-id=textbox61], [data-id=textbox58], [data-id=textbox47]').prop('disabled', false);
          $('#textbox101, #textbox102, [data-id=textbox101], [data-id=textbox102]').prop('disabled', true);
        }

        if($('#radiobutton11').is(':checked')) {
          var history_change = $("#unit_selection_history_change").val();
          var new_history_change = history_change + 'radiobutton11:true\n';
          $("#unit_selection_history_change").val(new_history_change);
          $('#textbox101, #textbox102, [data-id=textbox101], [data-id=textbox102]').prop('disabled', false);
          $('#textbox30, #textbox26, #textbox82, #textbox86, #textbox61, #textbox58, #textbox47, [data-id=textbox30], [data-id=textbox26], [data-id=textbox82], [data-id=textbox86], [data-id=textbox61], [data-id=textbox58], [data-id=textbox19], [data-id=textbox47]').prop('disabled', true);
        }
      } else {
        if($('#radiobutton10').is(':checked')) {
          var history_change = $("#unit_selection_history_change").val();
          if ($("#checkbox4").is(":checked")){
            $("#checkbox4").prop('checked', false);
            var new_history_change = history_change + 'radiobutton10:true\ncheckbox4:false\n';
          } else {
            var new_history_change = history_change + 'radiobutton10:true\n';
          }
          if ($("#checkbox19").is(":checked") == false){
            $('#textbox19, [data-id=textbox19]').prop('disabled', false);
            $('#textbox103, [data-id=textbox103]').prop('disabled', true);
          }
          $("#unit_selection_history_change").val(new_history_change);
          $('#textbox7, #textbox30, #textbox6, #textbox26, [data-id=textbox7], [data-id=textbox30], [data-id=textbox6], [data-id=textbox26], [data-id=textbox82], #textbox82, [data-id=textbox86], #textbox61, [data-id=textbox61], [data-id=textbox58], [data-id=textbox47]').prop('disabled', false);
          $('#textbox41, #textbox39, #textbox101, #textbox102, [data-id=textbox41], [data-id=textbox39], [data-id=textbox101], [data-id=textbox102]').prop('disabled', true);
        }

        if($('#radiobutton11').is(':checked')) {
          var history_change = $("#unit_selection_history_change").val();
          var new_history_change = history_change + 'radiobutton11:true\n';
          $("#unit_selection_history_change").val(new_history_change);
          $('#textbox41, #textbox39, #textbox101, #textbox102, [data-id=textbox41], [data-id=textbox39], [data-id=textbox101], [data-id=textbox102]').prop('disabled', false);
          $('#textbox7, #textbox30, #textbox6, #textbox26, #textbox82, #textbox86, #textbox61, #textbox58, #textbox47, [data-id=textbox7], [data-id=textbox30], [data-id=textbox6], [data-id=textbox26], [data-id=textbox82], [data-id=textbox86], [data-id=textbox61], [data-id=textbox58], [data-id=textbox47]').prop('disabled', true);
          if ($("#checkbox19").is(":checked") == false){
            $('#textbox19, [data-id=textbox19]').prop('disabled', true);
            $('#textbox103, [data-id=textbox103]').prop('disabled', false);
          }
        }
      }
    });
  }
});
