function showpopup() {
  $(".popup-darkbackground").fadeIn(400);
  $(".popup-createProject").fadeIn(400);
}
$(document).ready(function(){
  $('.review').on('click', function ()
  {
    showpopup();
  });
 $('.popup-darkbackground').on('click', function ()
  {
    $(".popup-darkbackground").fadeOut(500);
    $(".popup-createProject").fadeOut(500);
  });
 $('.close').on('click', function ()
  {
    $(".popup-darkbackground").fadeOut(500);
    $(".popup-createProject").fadeOut(500);
  });
 });