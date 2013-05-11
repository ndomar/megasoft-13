function showpopup() {
  $("#popup-projectbck").fadeIn(400);
  $("#popup-project").fadeIn(400);
}
function hidepopup() {
  $("#popup-projectbck").fadeOut(400);
  $("#popup-project").fadeOut(400);
}

function showCardsortForm(){
  $("#popup-projectbck").fadeIn(400);
  $("#popup-cardsortbck").fadeIn(400);
}
function hideCardsortForm(){
  $("#popup-cardsortbck").fadeOut(400);
  $("#popup-cardsort").fadeOut(400);
}

$(document).ready(function(){
 $('.add_button img').on('click', function ()
  {
    showpopup();
  });

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
    $(this).css("color","#FFFFFF");
  }, function()
  {
    $(this).css("cursor","pointer");
    $(this).css("background-color","#1b1b1b");
  });

  state=false;
  $('.project-div').on('click', function ()
  {
    $('#slidebutton').css({"visibility":"visible"});
    var side_width=$('#sidebar').width();
    if(side_width<=0)
      $('#slidebutton').click();
    var projectid = $(this).attr("ProjectId");
    var projectname = $(this).attr("ProjectName");
    $ ("#projectName").text(projectname);
    $("#Task").attr("href","projects/" + projectid + "/tasks/");
    $("#Design").attr("href","projects/design/" + projectid );
    $("#Statistics").attr("href","projects/" + projectid + "/statistics/");
    $("#Questionnaire").attr("href","/questionnaires/index?project_id=" + projectid);
    $("#Flowchart").attr("href","/pages/flowchart?project_id=" + projectid);
    $("#Review").attr("href","/pages?project_id=" + projectid);
    $("#Download").attr("href","/pages/download_project?project_id=" + projectid);
    $("#Settings").attr("href","designers/edit");
  });

  $("#projects").click(function(e){
    if (e.target === this){
      var side_width= $('#sidebar').width();
      if(side_width > 0)
        $('#slidebutton').click();
      }
  });

  $("#content").click(function(e){
    if (e.target === this){
      var side_width= $('#sidebar').width();
      if(side_width > 0)
        $('#slidebutton').click();
      }
  });

  $(".project-div").dblclick(function(){
    var projectid = $(this).attr("ProjectId");
    window.location.href = "/projects/design/" + projectid ;
  });

  $(".x-button").click(function(e){
    e.stopPropagation();
  });

  $(".project-div").click(function(){
    $('#cardsort-project_id').val($(this).attr("ProjectId"));
  });

  var heigh= $('.thumbnails').height();
  var limi= $('footer').offset();
  if(heigh>(limi.top-51)){
    $('.the_body').height("auto");
  }else{
    $('.the_body').height("100%");
  }

  $( document ).tooltip();
});

function deleteProject (id){
  var params = $.param({'id': id});
  bootbox.confirm("هل أنت متأكد من انك تريد مسح هذا المشروع ؟", function(result) {
    if(result){
      $.post('/projects/destroy?' + params);
    }
  }); 
}

