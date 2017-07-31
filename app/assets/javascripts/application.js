//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require smalot-bootstrap-datetimepicker
//= require smalot-bootstrap-datetimepicker/locales/bootstrap-datetimepicker.fr
//= require_tree .

$(document).ready(function() {
  // format mobile_phone input for login (expected : +336... )
  $('#mobile_phone').focusout(function() {
    var input = $(this).val();
    if (input.substr(0, 3) !== '+33') {
      var $formatted = input.replace(input.substr(0, 1), '+33').replace(/\s/g, '');
      $('#mobile_phone').val($formatted);
    }
  });
});
