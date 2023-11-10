
$(document).ready(function() {
  $('a.dropdown-unit, a.dropdown-category').click(function() {
    get_change_values(1);
  });

  $('#textbox50').blur(function() {
    get_change_values(2);
  });

  $('input[name=heater_select]').change(function() {
    get_change_values(3);
  });
});

function get_change_values(category_or_unit_change) {
  category_id = $('#air_mixture_category_id').val();
  unit_id = $('#air_mixture_unit_id').val();
  heater_select_value = $("input[name=heater_select]:checked").val();
  textbox50 = $('#textbox50').val();

  Rails.ajax({
    url: `/air_mixture_change_values?category_id=${category_id}&unit_id=${unit_id}&heater_select_value=${heater_select_value}&textbox50=${textbox50}&category_or_unit_change=${category_or_unit_change}`,
    type: 'GET',
    dataType: 'script',
    success: function(data) {},
    error: function(data) {}
  });
}
