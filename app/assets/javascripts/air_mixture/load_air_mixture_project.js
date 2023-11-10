$(document).ready(function() {
  $('body').on('click', '.ui-menu-item-wrapper', function() {
    var project_name = this.innerHTML;
    var current_menu = $(".navbar").find("li.active").find("a").text();
    if (current_menu == "Air mixture and capacity") {
      Rails.ajax({
        url: '/air_mixtures?project_name=' + project_name + '&reload_project=true',
        type: 'GET',
        dataType: 'script',
        success: function(data) {},
        error: function(data) {}
      });
    };
  });

  var air_mixture_projects = $('#air_mixture_data_project').data('air-mixture-projects');
  $('#air_mixture_project_name').autocomplete({
    source: air_mixture_projects
  });
});
