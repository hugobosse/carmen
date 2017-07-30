$(document).ready(function(){
  $('.datetimepicker').datetimepicker({
    minuteStep: 15,
    autoclose: true,
    format: 'yyyy-mm-dd hh:ii Z',
    timezone: 'GMT+2',
    startDate: new Date(),
    pickerPosition: 'bottom-left',
    language: 'fr',
    fontAwesome: true
  });
});
