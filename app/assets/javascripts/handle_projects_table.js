$(document).ready(function() {
  var model = $('#table-projects').data('model');

  Rails.ajax({
    url: `/projects?model=${model}`,
    type: 'GET',
    dataType: 'script',
    success: function(data) {},
    error: function(data) {}
  });

  $('#list_projects').on('click', 'tr', function() {
    if ($(this).hasClass('selected')) {
      return;
    }

    $('#list_projects tr').removeClass('selected');
    $(this).addClass('selected');

    var url = "";
    switch(model) {
      case "air_mixture":
        url = '/air_mixtures?project_name=' + $(this).data('project-name') + '&reload_project=true';
        break;
      case "room_calculation":
        url = '/room_calculation?project_name_hidden=' + $(this).data('project-name');
        break;
      case "unit_selection":
        url = '/unit_selection?project_name=' + $(this).data('project-name') + '&reload_project=true';
        $.LoadingOverlay("show");
        break;
    }

    Rails.ajax({
      url: url,
      type: 'GET',
      dataType: 'script',
      success: function(data) {
        if (model == "unit_selection") {
          $.LoadingOverlay("hide");
        }
      },
      error: function(data) {
        if (model == "unit_selection") {
          $.LoadingOverlay("hide");
        }
      }
    });
  });
});
