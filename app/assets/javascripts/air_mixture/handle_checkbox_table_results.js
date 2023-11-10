$(document).ready(function() {
  $('#air_mixture_calculation_results #select_all, #unit_selection_calculation_results #select_all').click(function() {
    if ($(this).is(':checked')) {
      $('.choosen-result-cb').prop('checked', true);
    } else {
      $('.choosen-result-cb').prop('checked', false);
    }
  });

  $('#air_mixture_calculation_results, #unit_selection_calculation_results').on('click', '.choosen-result-cb', function() {
    if ($('.choosen-result-cb:not(:checked)').length > 0) {
      $('#select_all').prop('checked', false);
    } else {
      $('#select_all').prop('checked', true);
    }
  });
});
