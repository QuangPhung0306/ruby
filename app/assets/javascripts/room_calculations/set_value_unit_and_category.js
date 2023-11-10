function calculation_set_value_unit_and_category(){
  $('.category_and_unit').on('click', '.dropdown-category', function(){
    $('.dropdown-unit').each(function(){
      $(this).show();
    });
    room_calculation_category_value = $(this).attr('data-id');
    $('.category').attr('data-id', room_calculation_category_value);
    $('#room_calculation_category_id').val(room_calculation_category_value).trigger('change');
    $('.dropdown-unit').filter('[data-category-id!=' + room_calculation_category_value + ']').each(function() {
      $(this).hide();
    });
  })

  $('.category_and_unit').on('click', '.dropdown-unit', function(){
    room_calculation_unit_value = $(this).attr('data-id');
    process_airflow_of_unit = parseFloat($(this).attr('data-dry-air'));
    wet_air_of_unit = parseFloat($(this).attr('data-wet-air'));
    number_of_unit = parseFloat($('#number_of_units').val());
    r003_b88 = process_airflow_of_unit*number_of_unit;
    r003_b102 = wet_air_of_unit*number_of_unit;

    if ($("#r003_si_mode").is(":checked")){
      $('#room_calculation_unit_id').val(room_calculation_unit_value);
      $('#cdej-process-airflow').val(r003_b88).trigger('change');
      $('#a-dr-model').val(r003_b102).trigger('change');

      $(".unit_button").text($(this).attr('data-name') + ", " + $(this).attr('data-capacity') + " kg/h at 20oC/60%RH");
    } else {
      $('#room_calculation_unit_id').val(room_calculation_unit_value);
      $('#cdej-process-airflow').val((r003_b88/1.699).toFixed(2)).trigger('change');
      $('#a-dr-model').val((r003_b102/1.699).toFixed(2)).trigger('change');

      $(".unit_button").text($(this).attr('data-name') + ", " + ($(this).attr('data-capacity')*2.204623).toFixed(2) + " lb/h at 68FDB /60%RH");
    }

  })
}

$(document).ready(function() {
  calculation_set_value_unit_and_category();
  $('.dropdown-unit').filter('[data-category-id!=1]').each(function() {
    $(this).hide();
  });
});
