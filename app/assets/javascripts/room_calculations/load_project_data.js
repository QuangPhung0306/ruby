$(document).ready(function() {
  $('body').on('click', '.ui-menu-item-wrapper', function() {
    check_mode = true;
    var name = $('#project_name').val();
    var current_menu = $(".navbar").find("li.active").find("a").text();
    if (current_menu == "Room calculation") {
	    $('#project_name_hidden').val(name);
	    $('#project_name_submit').click();
	  }
  });
  var availableProjects = $('#project_name').data('availableprojects');
  $('#project_name').autocomplete({
    source: availableProjects
  });
});
