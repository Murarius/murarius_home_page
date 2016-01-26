jQuery(function() {
  $('nav').hide();

  var position = $('.main').position().top;

  $(window).scroll(function() {
    if ($(window).scrollTop() > position) {
      $('nav').fadeIn();
    } else {
      $('nav').fadeOut();
    }
  });

});
