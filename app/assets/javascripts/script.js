$(document).ready(function() {
  $('.item').mouseenter(function() {
    $(this).addClass("item-hover");
    });
  $('.item').mouseleave(function() {
    $(this).removeClass("item-hover");
    });
});
