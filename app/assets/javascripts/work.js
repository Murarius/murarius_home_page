jQuery(function() {
  $('.project-thumb').each(function() {
    var base = this;
    $(base).hide();
    var tmpImg = new Image();
    var bg = $(this).css('background-image');
    bg = bg.replace(/.*\s?url\([\'\"]?/, '').replace(/[\'\"]?\).*/, '');
    tmpImg.src = bg;
    tmpImg.onload = function() {
      $(base).show();
      $(base).next().fadeOut();
    };
  });
});
