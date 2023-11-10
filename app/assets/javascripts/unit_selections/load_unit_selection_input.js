$(document).ready(function() {
  $('#data-rows-unit-selection').on('click', 'tr', function() {
    if ($(this).hasClass('selected')) {
      return;
    }

    var result_id = $(this).attr("data-unit-selection-result-id");

    $('#data-rows-unit-selection tr').removeClass('selected');
    $(this).addClass('selected');

    var unit_selection_input_id = $(this).data('unit-selection-input-id');

    Rails.ajax({
      url: '/unit_selection?id=' + unit_selection_input_id + '&click_result=true',
      type: 'GET',
      dataType: 'script',
      success: function(data) {
        var project_name = $("#project_name_unit_selection").val();
        var date_of_project = $("#unit_selection_datetimepicker").val();
        var unit_name = $("#unit").val();
        var si_ip_mode = $('#radiobutton5').is(':checked') ? 'si' : 'ip';
        var url = "/preview_and_print/unit_selection" + "?result_id=" + result_id + "&unit_name=" + unit_name + "&project_name=" + project_name + "&date_of_project=" + date_of_project + '&calculation_mode=' + si_ip_mode;
        $("#preview_and_print_button").attr("href", url);
      },
      error: function(data) {}
    });
  });
});
