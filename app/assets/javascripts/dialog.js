jQuery(function() {

  $(document).on('click', "#password-change, .login_click", function(evt) {
    evt.preventDefault();
    var url = $(this).attr('href');
    var title;
    url == '/login' ? title = 'LOGIN' : title = 'PASSWORD CHANGE';
    showDialog(url, title);
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

function showDialog(url, title) { //load content and open dialog
  $('#dialog').html('');
  $('#ui-id-1').html(title);
  $('#dialog').load(url + ' .content', function() {
    $('#session_login').focus();
  });
  $('#dialog').dialog('open');
}
