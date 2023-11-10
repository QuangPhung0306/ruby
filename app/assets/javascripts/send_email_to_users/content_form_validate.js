function validate_content_email(){
  $('#form_send_email').validate({
    rules:{
      'content': {
        required: true
      }
    },
    messages:{
      'content': {
        required: I18n.t('js.send_email.content_required')
      }
    }
  });
}

$(document).ready(function() {
  validate_content_email();
});
