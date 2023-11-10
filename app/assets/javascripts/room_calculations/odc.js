function calculation_odc(){
  $('.calculation_data_inputs').on('change', '#odc-temperature, #odc-relative-humidity, #odc-atmospheric-pressure', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    r003_moisture_content_odc = 622/(r003_b15/Math.exp(12.03 - 4025/(r003_b13 + 235))/10/r003_b14 - 1);

    if ($("#r003_si_mode").is(":checked")){
      $('#odc').val(r003_moisture_content_odc.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#odc').val((r003_moisture_content_odc*7).toFixed(2)).trigger('change', ['false']);
    }
  });
}

$(document).ready(function() {
  calculation_odc();
});
