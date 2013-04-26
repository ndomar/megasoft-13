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

  $('.options').hover(function()
  {
    $(this).css("cursor","pointer");
    $(this).css("background-color","#6699FF");
  }, function()
  {
    $(this).css("cursor","pointer");
    $(this).css("background-color","#1b1b1b");
  });

  $('.project-div').on('click', function ()
  {
    if ($('#sidebar').css("width") == '0px'){
       $('#content').animate({
      "margin-left": '-9%'
    }, "medium");
    $('#projects').animate({
      "margin-right" : '0px'
    });
    $('#sidebar-content').fadeIn();
     $("#wrapper").animate({'padding-right' : sidebar_width+'px'}, 400);
      $("#sidebar").animate({'width':sidebar_width+'px'},600);
      $('#slidebutton').animate({'margin-left' : '-10px'},{
        duration:400,
        step: function(now, fx) {
          $('#slidebutton').css('transform','scaleX(1)');
        }
      });
      state = false;
      state2 = true;
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

var state2 = false;

  $('#slidebutton').on('click', function ()
  {
    if (state2){
    $('#content').animate({
      "margin-left": '-9%'
    }, "medium");
    $('#projects').animate({
      "margin-right" : '0px'
    });
    $('#sidebar-content').fadeIn();
    state2=false;
  }else{

     $('#content').animate({
      "margin-left": '0%'
    }, "medium");
     $('#projects').animate({
      "margin-right" : '10%'
    });
     $('#sidebar-content').fadeOut();
     state2=true;
   }
  });
});

function deleteProject (id){
  var params = $.param({
    'id': id
  });
  $.ajax({
    url: '/projects/destroy?' + params,
  });
}