jQuery(function() {
  $( "#datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'MM yy',
    minDate: "-4Y",
    maxDate: "+1Y"
  });

  $( "#ui-datepicker-div" ).hide();

});
