jQuery(function() {
  $('#upload-btn').on('click', function(evt) {
    evt.prevent_default;
    $('input[id=project_thumb]').click();
  //  $(this).blur();
  });

  $('#project_thumb').on('change', function() {
    var file_block = '';
    $('#file-display').val(function() {
      file_block = $('#project_thumb')[0].files[0].name;
      console.log(file_block);
      return file_block;
    });
  });
});
