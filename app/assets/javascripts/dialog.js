jQuery(function() {

  $(document).on('click', "#password-change, .login_click", function(evt) {
    evt.preventDefault();
    var url = $(this).attr('href');
    showDialog(url);
    return false;
  });

  $('#dialog').dialog({ //create dialog, but keep it closed
    position: {
      my: 'center center-100',
      at: 'center',
      of: window
    },
    autoOpen: false,
    width: 400,
    modal: true
  });

});

function showDialog(url) { //load content and open dialog
  $('#dialog').html('');
  $('#dialog').load(url + ' .content', function() {
    $('#session_login').focus();
  });
  $('#dialog').dialog('open');
}
