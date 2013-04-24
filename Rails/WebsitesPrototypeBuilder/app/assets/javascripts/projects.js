function showpopup() {
  $(".popup-darkbackground").fadeIn(400);
  $(".popup-createProject").fadeIn(400);
}

function hidepopup() {
  $(".popup-darkbackground").fadeOut(500);
  $(".popup-createProject").fadeOut(500);
}

$(document).ready(function(){
 
 $('.popup-darkbackground').on('click', function ()
  {
    $(".popup-darkbackground").fadeOut(500);
    $(".popup-createProject").fadeOut(500);
  });
  $('.project-div').hover(function()
  {
    $(this).css("cursor","pointer");
    $(this).children('.icon-remove').fadeIn();
  }, function()
  {
    $(this).css("cursor","pointer");
    $(this).children('.icon-remove').fadeOut();
  });

  $('.project-div').on('click', function ()
  {
    var projectid = $(this).attr("ProjectId");
    var projectname = $(this).attr("ProjectName");
    $ ("#projectName").text(projectname);
    $("#Design").attr("href","projects/design/" + projectid);
    $("#Task").attr("href","tasks/index/" + projectid);
    $("#sidebar").show("medium");
    $('#content').animate({
      "left": '-200px'
    }, 5000);
  });

  $('#arrow').on('click', function ()
  {
    $("#sidebar").hide("medium");
    $(".body").css("float","none");

  });
});
