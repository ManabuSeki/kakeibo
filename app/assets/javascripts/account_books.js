$(function() {
  $("body").on('click','.pop',function(){
    var data = $(this).attr('id');
    $('.hide_tb' + data).css('background-color', '#FFFFCC');
    $('.hide_tb' + data).toggle();
  });
});

