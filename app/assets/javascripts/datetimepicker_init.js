$(document).ready(function(){
  $('.datetimepicker').datetimepicker({
    minuteStep: 15,
    autoclose: true,
    format: 'yyyy-mm-dd hh:ii Z',
    timezone: 'GMT+2',
    pickerPosition: 'bottom-left',
    language: 'fr',
    fontAwesome: true
  });
});
