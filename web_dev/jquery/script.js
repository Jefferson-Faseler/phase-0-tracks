$(function()) {
  $('#footer-nav').before('<button id="shownav">Navigation</button>');

  $('#shownav').on('click', function() {
    $('#footer-nav').fadeIn(1000);
  });
});