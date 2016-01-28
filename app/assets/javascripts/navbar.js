jQuery(function() {
  $('nav').hide();

  $(window).scroll(function() {
    var position = $('.main').offset().top;

    if ($(window).scrollTop() > position) {
      $('nav').fadeIn();
    } else {
      $('nav').fadeOut();
    }
  });

  $('.goto').on('click', function(e){
    e.preventDefault();
    var destination = $(this).attr('href');
    var destination_position = $(destination).offset().top - 50;
    $("html, body").animate({ scrollTop: destination_position }, 500);
  });

});
