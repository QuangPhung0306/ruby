$(document).ready(function() {
  $('#r_flow_rate').val(0).trigger('change');
  $('#f_temperature').val(30).trigger('change');
  $('#f_absolute_humidity').val(16).trigger('change');
  $('#a_temperature').val(20).trigger('change');
  $('#a_absolute_humidity').val(7.3).trigger('change');

  window.r_flow_rate = 0;
  window.f_temperature = 30;
  window.f_absolute_humidity = 16;
  window.a_temperature = 20;
  window.a_absolute_humidity = 7.3;
});
