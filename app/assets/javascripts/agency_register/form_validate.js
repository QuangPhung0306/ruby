function validate_register_data(){
  $('#agency_registration').validate({
    rules:{
      'user[agency][name]':{
        required: true
      },
      'user[email]':{
        required: true,
        pattern: /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/,
        maxlength: 255
      }
    },
    messages:{
      'user[agency][name]':{
        required: I18n.t('js.agency_register.agency_name_required')
      },
      'user[email]':{
        required: I18n.t('js.login.email_required'),
        pattern: I18n.t('js.login.email_invalid'),
        maxlength: I18n.t('js.login.email_invalid')
      }
    }
  });
}

$(document).ready(function() {
  validate_register_data();
});
