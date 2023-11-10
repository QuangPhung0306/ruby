$(document).ready(function(){
  hash_user_ids_selected = new Object();
  $('#checkall').click(function() {
    if ($(this).is(':checked')) {
      $.each($(this).data('users'), function(index, value) {
        hash_user_ids_selected[value] = ''
      });      
      $('#send-email-btn').attr('data-user-ids-selected', Object.keys(hash_user_ids_selected).join(','));
      $('.checkbox-select-user').prop('checked', true);
    } else {
      hash_user_ids_selected = new Object();
      $('#send-email-btn').attr('data-user-ids-selected', '');
      $('.checkbox-select-user').prop('checked', false);
    }

    Object.keys(hash_user_ids_selected).length > 0 ? $('#send-email-btn').prop('disabled', false) : $('#send-email-btn').prop('disabled', true);
  });

  $('#users').on('click', '.checkbox-select-user', function(event){
    if (hash_user_ids_selected.hasOwnProperty($(this).val())) {
      delete(hash_user_ids_selected[$(this).val()]);
    } else {
      hash_user_ids_selected[$(this).val()] = ''
    }
    $('#send-email-btn').attr('data-user-ids-selected', Object.keys(hash_user_ids_selected).join(','));
    Object.keys(hash_user_ids_selected).length > 0 ? $('#send-email-btn').prop('disabled', false) : $('#send-email-btn').prop('disabled', true);
  
    if (!$(this).is(':checked')) {
      $("#checkall").prop('checked', false);
    }
  });

  $('#agency_registration_button').on('click', function(event){
    document.getElementById('agency_registration').reset();
    $("#agency_registration").validate().resetForm();
    $("#agency_registration input").removeClass("error text-danger");
  });
});
