$(document).ready(function() {
  $('#air_mixture_calculation_results .table_results, #unit_selection_calculation_results .table_results').on('mousewheel DOMMouseScroll', function (e){
    var e0 = e.originalEvent,
    delta = e0.wheelDelta || -e0.detail;

    this.scrollTop += ( delta < 0 ? 1 : -1 ) * 30;
    e.preventDefault();
  });
});
