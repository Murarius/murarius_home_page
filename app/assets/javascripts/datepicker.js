jQuery(function() {
  $( "#datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'yy-mm-dd',
    minDate: "-4Y",
    maxDate: "+1Y"
  });

  $( "#ui-datepicker-div" ).hide();

});
