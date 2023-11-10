$(document).ready(function () {
  if ($('#unit-selections-page').length > 0) {
    $('#unit-selections-page').on("click", "#button4", function () {
      var rotation_rate = convert_comma_to_dot($('#textbox8').val());
      if(rotation_rate == ""){return;}
      $('#gg_textbox2').val(rotation_rate - 10);
      $('#gg_textbox3').val(rotation_rate + 10);
      $('#gg_textbox1').val(5);
    });

    $('#unit-selections-page').on("click", "#unit_selection_search_start", function () {
      $('#unit_selection_search_modal').modal('hide');
      $.LoadingOverlay("show");

      let dataSearch = new FormData();
      data_search_hash = {search_data: {}, history_change: ''};
      data_search_hash['history_change'] = $("#unit_selection_history_change").val();
      data_search_hash['search_data']['textbox2'] = convert_comma_to_dot($('#gg_textbox2').val());
      data_search_hash['search_data']['textbox3'] = convert_comma_to_dot($('#gg_textbox3').val());
      data_search_hash['search_data']['textbox1'] = convert_comma_to_dot($('#gg_textbox1').val());
      data_search_hash['search_data']['label6'] = 1;
      data_search_hash['unit_selection_input_id'] = $('#current_unit_selection_input_id').val();

      dataSearch.append('unit_selection_search', JSON.stringify(data_search_hash));
      Rails.ajax({
        url: '/unit_selection/search_rotations',
        type: 'POST',
        data: dataSearch,
        dataType: 'script',
        success: function(data) {
          $.LoadingOverlay("hide");
        },
        error: function(data) {
          $.LoadingOverlay("hide");
        }
      });
    });

    $('body').on("change", "#textbox8, [data-id=textbox8]", function () {
      $('#textbox8').val($(this).val());
      $('[data-id=textbox8]').val($(this).val());
      var history_change = $("#unit_selection_history_change").val();
      var new_history_change = history_change + 'textbox8' + ':' + convert_comma_to_dot($(this).val()) + '\n';
      $("#unit_selection_history_change").val(new_history_change);
    });
  };

  $('body').on('click', '#js-btn-unit-selection-search', function() {
    $('#button4').trigger('click');
  });
});
