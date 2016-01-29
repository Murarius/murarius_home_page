jQuery(function() {
  $('body').on('click', '.close', function(e) {
    console.log(this);
    e.preventDefault();
    $(this).parent().parent().remove();
  });
});
