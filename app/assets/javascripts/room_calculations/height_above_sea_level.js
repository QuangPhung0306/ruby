$(document).ready(function() {
  if($('#room_calculation_page').length > 0) {
    $('#room_calculation_page').on('change', 'input[data-id=height_above_sea_level]', function() {
      $('input[data-id=height_above_sea_level]').val($(this).val());
      r003_base_atmospheric_pressure = Math.pow((44.331514 - convert_comma_to_dot($(this).val()) / 1000) / 11.880516, 5.255877);
      $('#drc-atmospheric-pressure').val(r003_base_atmospheric_pressure.toFixed(1));
      $('#drc-atmospheric-pressure').trigger('change');
      $('input[data-id=base_atmospheric_pressure]').val(r003_base_atmospheric_pressure.toFixed(1));
    });
  }
});
