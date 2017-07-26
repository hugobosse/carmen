$(document).ready(function(){
  $('.datetimepicker').datetimepicker({
    minuteStep: 10,
    autoclose: true,
    format: 'yyyy-mm-dd hh:ii Z',
    timezone: 'GMT+2',
    pickerPosition: "top-left"
  });
});
