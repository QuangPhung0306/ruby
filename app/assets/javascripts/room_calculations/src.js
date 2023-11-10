function calculation_src(){
  $('.calculation_data_inputs').on('change', '#src-temperature, #src-relative-humidity, #src-atmospheric-pressure', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    r003_moisture_content_src = 622/(r003_b21/Math.exp(12.03 - 4025/(r003_b19 + 235))/10/r003_b20 - 1);

    if ($("#r003_si_mode").is(":checked")){
      $('#src').val(r003_moisture_content_src.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#src').val((r003_moisture_content_src*7).toFixed(2)).trigger('change', ['false']);
    }
  });
}

$(document).ready(function() {
  calculation_src();
});
