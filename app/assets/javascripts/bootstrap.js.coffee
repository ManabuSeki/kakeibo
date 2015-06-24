jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $.fn.datepicker.dates.ja.format = 'yyyy-mm-dd'
  $('.datepicker')
  .parent('.input-append')
  .addClass('date')
  .datepicker
    language: 'ja'
