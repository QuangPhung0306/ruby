function validate_login_data(){
  $('.new_user').validate({
    rules:{
      'user[email]':{
        required: true,
        pattern: /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/,
        maxlength: 255
      },
      'user[password]':{
        required: true,
        pattern: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).+$/,
        maxlength: 8,
        minlength: 8
      }
    },
    messages:{
      'user[email]':{
        required: I18n.t('js.login.email_required'),
        pattern: I18n.t('js.login.email_invalid'),
        maxlength: I18n.t('js.login.email_invalid')
      },
      'user[password]':{
        required: I18n.t('js.login.password_required'),
        pattern: I18n.t('js.login.password_invalid'),
        maxlength: I18n.t('js.login.password_must_be_8_character'),
        minlength: I18n.t('js.login.password_must_be_8_character')
      }
    }
  });
}

$(document).ready(function() {
  validate_login_data();
});
