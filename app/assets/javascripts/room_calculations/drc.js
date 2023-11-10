$(document).ready(function() {
  $('.calculation_data_inputs').on('change', '#drc-temperature, #drc-relative-humidity', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    drc_logic();
  });


  $('.calculation_data_inputs').on('change', '#drc-atmospheric-pressure', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    $('#odc-atmospheric-pressure').val(r003_b9).trigger("change");
    $('#src-atmospheric-pressure').val(r003_b9).trigger("change");

    drc_logic();

    r003_total_water_surface = r003_b61*r003_ows_pool_surface*(622/(r003_b9/Math.exp(12.03-4025/(r003_b60+235))/1000-1)-r003_moisture_content_drc)/1000;
    if ($("#r003_si_mode").is(":checked")){
      $('#ows-total-water-surface').val(r003_total_water_surface.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#ows-total-water-surface').val((r003_total_water_surface*2.204623).toFixed(2)).trigger('change', ['false']);
    }
  });
  function drc_logic(){
    r003_moisture_content_drc = 622/(r003_b9/Math.exp(12.03 - 4025/(r003_b7 + 235))/10/r003_b8 - 1);
    r003_b60 = r003_b7;

    if ($("#r003_si_mode").is(":checked")){
      $('#ows-water-temperature').val(r003_b7).trigger('change', ['false']);
      $('#drc').val(r003_moisture_content_drc.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#ows-water-temperature').val(r003_b7*1.8+32).trigger('change', ['false']);
      $('#drc').val((r003_moisture_content_drc*7).toFixed(2)).trigger('change', ['false']);
    }
  }
});
