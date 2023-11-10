function calculation_fgh(){
  $('.calculation_data_inputs').on('change', '#b-total-dry-air-flow, #tml, #vii-total-ventilation-from-outdoor', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    fgh_logic();
  });

  $('.calculation_data_inputs').on('change', '#hgf-pre-cooling', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    fgh_logic();
    cdej_logic();
    calculation_b_logic();
  });

  $('.calculation_data_inputs').on('change', '#hgf-ambient', function(event, status=true) {
    set_global_value($(this).attr("id"), status, convert_comma_to_dot($(this).val()));
    fgh_logic();
    calculation_b_logic();
  });
}

function fgh_logic(){
  r003_fgh_leakage = r003_b105+r003_b106+r003_b112-r003_cdej_return_air_direct;
  r003_fgh_total_airflow = r003_b106+r003_b105+r003_b88-r003_b102;

  ventilation = r003_fgh_leakage > r003_vii_total_outdoor ? r003_vii_total_load_ventilation : ((r003_moisture_content_odc-r003_moisture_content_drc)/1000*r003_fgh_leakage*1.2);
  r003_hfg_needed_moisture_content = r003_moisture_content_drc-1000*(r003_tml-ventilation)/r003_fgh_total_airflow/1.2;
  if ($("#r003_si_mode").is(":checked")){
    $('#hgf-total-airflow').val(r003_fgh_total_airflow.toFixed(2));
    $('#hgf-leakage').val(r003_fgh_leakage.toFixed(2));
    $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content).toFixed(2));
  } else {
    $('#hgf-total-airflow').val((r003_fgh_total_airflow/1.699).toFixed(2));
    $('#hgf-leakage').val((r003_fgh_leakage/1.699).toFixed(2));
    $('#hgf-needed-moisture-content').val(parseFloat(r003_hfg_needed_moisture_content*7).toFixed(2));
  }
}

$(document).ready(function() {
  calculation_fgh();
});
