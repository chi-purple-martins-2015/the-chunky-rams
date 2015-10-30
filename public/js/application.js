$(document).ready(function() {


  $('.username').keypress(function(e) {
    if (e.which == 13) {
      $('form#user-search').submit();
    }
  });

  $('.tagname').keypress(function(e) {
    if (e.which == 13) {
      $('form#tag-search').submit();
    }
  });
  // $("#popular").fadeIn();


});
