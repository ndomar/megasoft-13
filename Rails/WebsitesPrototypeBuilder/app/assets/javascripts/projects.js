function showpopup() {
  $(".popup-darkscree").fadeIn(400);
}

function hidepopup() {
  $(".popup-darkscree").fadeOut(400);
}
$(document).ready(function(){
  $('.thumbnail').mouseover(function()
  {
    $(this).css("cursor","pointer");
    $('.icon-remover').fadeIn(500);
  });

  $('.thumbnail').on('click', function ()
  {

    var projectid = $(this).attr("ProjectId");
    var projectname = $(this).attr("ProjectName");
    $ ("#projectName").text(projectname);
    $("#Design").attr("href","projects/design/" + projectid);
    $("#Task").attr("href","tasks/index/" + projectid);
    $("#sidebar").show("medium");
  });

});
