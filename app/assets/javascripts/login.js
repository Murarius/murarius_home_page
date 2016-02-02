jQuery(function() {

  $(document).on('click', '.login_click', function(evt) {
    evt.prevent_default;
    var url = $('.login_click').attr('href');
    showDialog(url);
    return false;
  });
  // end click

  $('#login_dialog').dialog({ //create dialog, but keep it closed
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
  $('#login_dialog').html('');
  $('#login_dialog').load(url + ' .content', function() {
    $('#session_login').focus();
  });
  $('#login_dialog').dialog('open');
}
