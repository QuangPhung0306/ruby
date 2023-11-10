$(document).ready(function() {
  $('#checkall').click(function() {
    enableOrDisableButtonDelete();
  });

  $('#users').on('click', '.checkbox-select-user', function(){
    enableOrDisableButtonDelete();
  });
});

function enableOrDisableButtonDelete() {
  if ($(".checkbox-select-user:checked").length > 0) {
    $('#delete-btn').prop('disabled', false);
  } else {
    $('#delete-btn').prop('disabled', true);
  }
}
