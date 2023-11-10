$(document).ready(function() {
  $('body').on('click', '.ui-menu-item-wrapper', function() {
    var project_name = this.innerHTML;
    var current_menu = $(".navbar").find("li.active").find("a").text();
    if (current_menu == "Unit selection") {
      $.LoadingOverlay("show");
      Rails.ajax({
        url: '/unit_selection?project_name=' + project_name + '&reload_project=true',
        type: 'GET',
        dataType: 'script',
        success: function(data) {
          $.LoadingOverlay("hide");
        },
        error: function(data) {
          $.LoadingOverlay("hide");
        }
      });
    };
  });

  var unit_selection_projects = $('#unit_selection_data_project').data('unit-selection-projects');
  $('#project_name_unit_selection').autocomplete({
    source: unit_selection_projects
  });
});
