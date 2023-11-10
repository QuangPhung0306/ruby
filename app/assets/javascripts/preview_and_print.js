$(document).ready(function() {
  $('.print').click(function() {
    $('#tabs-prev1 .prev_container, #tabs-prev2 .prev_container, #tabs-prev3 .prev_container, .print-container').printThis({
    	loadCSS: "css/print.css",
    });
  });
  $('.close_preview_print').click(function() {
    window.close();
  });
});
