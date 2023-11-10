$(document).ready(function(){
  $('#modal_ct').on('show.bs.modal', function(e) {
    event.preventDefault();
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
  });

  $('#modal_delete_users').on('show.bs.modal', function(e) {
    event.preventDefault();
    users_id_selected = [];
    $('.checkbox-select-user:checked').each(function() {
      users_id_selected.push(parseInt($(this).val()));
    });

    delete_users_path = `/batch_deletes/users?users_id_selected=${users_id_selected.join()}`;
    $('#modal_delete_users .btn-ok').attr('href', delete_users_path);
  });

  $('#modal_rs').on('show.bs.modal', function(e) {
    $(this).find('#agency-name').text($(e.relatedTarget).data('name'));
    $(this).find('#email-address').text($(e.relatedTarget).data('email'));
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
  });

  $('#modal_email').on('show.bs.modal', function(e) {
    $(this).find('#user_ids_to_send_email').val($('#send-email-btn').attr('data-user-ids-selected'));
  });
});
