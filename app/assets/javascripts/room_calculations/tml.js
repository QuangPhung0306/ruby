function calculation_tml(){
  $('.calculation_data_inputs').on('change', '#other, #pd, #pitr, #ows-total-water-surface', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    tml_logic();
  });

  $('.calculation_data_inputs').on('change', '#vii-total-load-from-ventilation', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    tml_logic();

    ventilation = r003_fgh_leakage > r003_vii_total_outdoor ? r003_vii_total_load_ventilation : ((r003_moisture_content_odc-r003_moisture_content_drc)/1000*r003_fgh_leakage*1.2);
    r003_hfg_needed_moisture_content = r003_moisture_content_drc-1000*(r003_tml-ventilation)/r003_fgh_total_airflow/1.2;

    if ($("#r003_si_mode").is(":checked")) {
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content).toFixed(2));
    } else {
      $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content*7).toFixed(2));
    }
  });

function tml_logic(){
  r003_tml = r003_total_water_surface+r003_pd+r003_other+r003_pitr+r003_vii_total_load_ventilation;

  if ($("#r003_si_mode").is(":checked")) {
    $('#tml').val(r003_tml.toFixed(2)).trigger('change', ['false']);
    $('.txt_tml').html(r003_tml.toFixed(2) + ' kg/h').addClass('color_red');
  } else {
    $('#tml').val((r003_tml*2.204623).toFixed(2)).trigger('change', ['false']);
    $('.txt_tml').html((r003_tml*2.204623).toFixed(2) + ' lb/h').addClass('color_red');
  }
}

}

$(document).ready(function() {
  calculation_tml();
});
