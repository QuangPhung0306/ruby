$(document).ready(function() {
  $('.header_pw').on("click", "#logout_button", function(){
    $("#confirm_logout_modal").modal("show");
  });

  $(".div_btn_logout").on("click", "#btn_logout_ok", function(event){
    $("#logout_user").submit();
  });
});
