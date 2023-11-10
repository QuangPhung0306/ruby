$(document).ready(function() {
  $('ul.navbar-nav a').filter(function() {
    return window.location.href.includes(this.href);
  }).parent().addClass('active');
});
