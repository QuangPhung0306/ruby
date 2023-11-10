function calculation_pitr(){
  $('.calculation_data_inputs').on('change', '#pitr-number-people, #pitr-moisture-load', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    r003_pitr = r003_b52*r003_b53;

    if ($("#r003_si_mode").is(":checked")) {
      $('#pitr').val(r003_pitr.toFixed(2)).trigger('change', ['false']);
    } else {
      $('#pitr').val((r003_pitr*2.204623).toFixed(2)).trigger('change', ['false']);
    }
  });
}

$(document).ready(function() {
  calculation_pitr();
});
