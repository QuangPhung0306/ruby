function calculation_pd(){
  $('.calculation_data_inputs').on('change', '#pd-total-weight-product, #pd-percentage-moisture, #pd-percentage-dried', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    r003_pd = (r003_b65)*(r003_b66)*r003_b67;

    if ($("#r003_si_mode").is(":checked")){
      $('#pd').val(r003_pd.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#pd').val((r003_pd*2.204623).toFixed(2)).trigger('change', ['false']);
    }
  });
}

$(document).ready(function() {
  calculation_pd();
});
