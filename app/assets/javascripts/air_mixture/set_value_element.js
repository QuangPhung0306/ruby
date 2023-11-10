function setValueSectionElement(element, value) {
  if (element != "s_temperature") {
    if ($.isNumeric(value)) {
      var to_fixed_value = toFixedValue(value);
      $(`#${element}_display`).text(to_fixed_value);
      $(`#tabs_section_summary #${element}`).val(to_fixed_value).trigger('change');
      $(`.tab-pane:not(#tabs_section_summary) #${element}`).val(value).trigger('change');
    } else {
      $(`#${element}_display`).text("N/A");
      $(`#${element}`).val("N/A").trigger('change');
    };
  }
};
function setInputDisplayElement(element, value) {
  if ($.isNumeric(value)) {
    var to_fixed_value = toFixedValue(value);
    $(`#${element}_display`).val(to_fixed_value);
    $(`#${element}`).val(value);
    $(`#${element}_display`).blur();
  } else {
    $(`#${element}_display`).val("N/A");
  };
};

function toFixedValue(value) {
  if ($.isNumeric(value)) {
    var fix_two_precision =  convert_comma_to_dot(value).toFixed(2);
    var fix_one_precision = convert_comma_to_dot(value).toFixed(1);
    var round_value = Math.round(convert_comma_to_dot(value));

    if ((round_value - fix_one_precision == 0) && (round_value - fix_two_precision == 0)) {
      return round_value;
    } else if (fix_two_precision - fix_one_precision == 0) {
      return fix_one_precision;
    } else {
      return fix_two_precision;
    }
  } else {
    return "N/A"
  }
}
