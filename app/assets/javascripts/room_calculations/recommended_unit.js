$(document).ready(function() {
  $('.category_and_unit').on('click', '.dropdown-category', function(){
    tml = r003_tml;
    number_of_units = parseInt($('#number_of_units').val());
    compare_value = tml/number_of_units;

    category_id = $(this).attr('data-id');
    capacity_of_units = document.querySelectorAll("[data-category-id='" + category_id +"']");

    unit_calculation(compare_value, capacity_of_units);
  });

  $('.category_and_unit, .calculation_data_inputs').on('change', '#number_of_units, #tml', function() {
    tml = r003_tml;
    number_of_units = parseInt($('#number_of_units').val());
    compare_value = tml/number_of_units;

    category_id = $('.category').attr('data-id');
    capacity_of_units = document.querySelectorAll("[data-category-id='" + category_id +"']");

    unit_calculation(compare_value, capacity_of_units)
  });
});

function unit_calculation(compare_value, capacity_of_units) {
  var recommended_units = [];
  for(i = 0; i < capacity_of_units.length; i++){
    recommended_unit = capacity_of_units[i];
    if ($(recommended_unit).data('capacity') > compare_value) {
      recommended_units.push(recommended_unit);
    }
  }

  var index = 0;
  var min_capacity = parseFloat($(recommended_units[0]).data('capacity'));
  for(j = 0; j < recommended_units.length; j++) {
    min = parseFloat($(recommended_units[j]).data('capacity'));
    if (min < min_capacity) {
      min_capacity = min;
      index = j;
    }
  }

  if (!recommended_units.length && !isNaN(tml)) {
    $('.txt_rcm').html(I18n.t('js.room_calculation.blank_recommened_unit'));
    $('.unit_button').text('+ Choose one');
    $('#room_calculation_unit_id').val('');
  }
  else if (isNaN(tml)){
    $('.txt_rcm').html('');
    $('.unit_button').text('+ Choose one');
    $('#room_calculation_unit_id').val('');
  }
  else{
    $('.txt_rcm').html('');
    $(recommended_units[index]).click();
  }
}
