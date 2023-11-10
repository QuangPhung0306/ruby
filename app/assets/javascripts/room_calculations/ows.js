function calculation_ows(){
  $('.calculation_data_inputs').on('change', '#ows-pool-length, #ows-pool-width, #ows-water-temperature, #ows-vaporization-coefficient', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));

    r003_ows_pool_surface = r003_b57*r003_b58
    r003_total_water_surface = r003_b61*r003_ows_pool_surface*(622/(r003_b9/Math.exp(12.03-4025/(r003_b60+235))/1000-1)-r003_moisture_content_drc)/1000;

    if ($("#r003_si_mode").is(":checked")){
      $('#ows-pool-surface').val(r003_ows_pool_surface.toFixed(2));
      $('#ows-total-water-surface').val(r003_total_water_surface.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#ows-pool-surface').val((r003_ows_pool_surface/0.092903).toFixed(2));
      $('#ows-total-water-surface').val((r003_total_water_surface*2.204623).toFixed(2)).trigger('change', ['false']);
    }
  });
}

$(document).ready(function() {
  calculation_ows();
});
