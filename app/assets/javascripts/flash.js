jQuery(function() {
  $('body').on('click', '.close', function(e) {
    e.preventDefault();
    $(this).parent().parent().remove();
  });

  $('#flash-main').bind('DOMSubtreeModified', function(e) {
    $(this).children().delay(4000).fadeOut('slow');
  });

  $('#flash-main').children().delay(4000).fadeOut('slow');

});
