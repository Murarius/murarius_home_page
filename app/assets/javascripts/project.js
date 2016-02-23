jQuery(function() {
  $('#upload-btn').on('click', function(evt) {
    evt.prevent_default;
    $('input[id=project_thumb]').click();
  });

  $('#project_thumb').on('change', function() {
    var file_block = $('#project_thumb')[0].files[0].name;
    $('#file-display').val(file_block);
  });
});
