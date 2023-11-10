$(document).ready(function() {
  if($('.new-air-mixtures-project').length > 0) {
    $('#pills-tabContent').on('change', '#height_above_sea_level', function() {
      window.ac_atmospheric_pressure = Math.pow((44.331514 - convert_comma_to_dot($(this).val()) / 1000) / 11.880516, 5.255877).toFixed(1);
      $('#ac_atmospheric_pressure').val(window.ac_atmospheric_pressure);
      $('#ac_atmospheric_pressure').trigger('change');
    });
  }
});
