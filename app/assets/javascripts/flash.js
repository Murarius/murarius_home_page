jQuery(function() {
  $('body').on('click', '.close', function(e) {
    e.preventDefault();
    $(this).parent().parent().remove();
  });

  $('#flash-main').bind('DOMSubtreeModified', function(e) {
    $(this).children().delay(2000).fadeOut('slow');
  });

  $('#flash-main').children().delay(2000).fadeOut('slow');

});
