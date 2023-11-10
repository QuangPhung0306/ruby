$(document).ready(function() {
  $('#data-rows').on('click', 'tr', function() {
    if ($(this).hasClass('selected')) {
      return;
    }

    $('#data-rows tr').removeClass('selected');
    $(this).addClass('selected');

    var air_mixture_input_id = $(this).data('air-mixture-input-id');
    Rails.ajax({
      url: '/air_mixtures?id=' + air_mixture_input_id + '&click_result=true',
      type: 'GET',
      dataType: 'script',
      success: function(data) {},
      error: function(data) {}
    });
  });
});
