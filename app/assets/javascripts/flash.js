jQuery(function() {
  $('body').on('click', '.close', function(e) {
    e.preventDefault();
    $(this).parent().parent().remove();
  });
});
