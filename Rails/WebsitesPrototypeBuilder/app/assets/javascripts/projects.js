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
    $(this).children('.x-button').fadeIn();
  }, function()
  {
    $(this).css("cursor","pointer");
    $(this).children('.x-button').fadeOut();
  });


  $('.project-div').on('click', function ()
  {
    if ($('#sidebar').css("width") == '0px'){
      $('#slidebutton').click();
      return;
    }
    var projectid = $(this).attr("ProjectId");
    var projectname = $(this).attr("ProjectName");
    $ ("#projectName").text(projectname);
    $("#Design").attr("href","projects/design/" + projectid);
    $("#Task").attr("href","tasks/index/" + projectid);
    $("#sidebar").show("medium");
    $('#content').animate({
      "margin-left": '-9%'
    }, "medium");
  });

  $(".project-div").dblclick(function(){
      var projectid = $(this).attr("ProjectId");
      window.location.href = "/projects/design/" + projectid ;

});

var state = false;

  $('#slidebutton').on('click', function ()
  {
    if (state){
    $('#content').animate({
      "margin-left": '-9%'
    }, "medium");
    $('#projects').animate({
      "margin-right" : '0px'
    });
    $('#sidebar-content').fadeIn();
    state=false;
  }else{

     $('#content').animate({
      "margin-left": '0%'
    }, "medium");
     $('#projects').animate({
      "margin-right" : '10%'
    });
     $('#sidebar-content').fadeOut();
     state=true;
   }
  });
});
