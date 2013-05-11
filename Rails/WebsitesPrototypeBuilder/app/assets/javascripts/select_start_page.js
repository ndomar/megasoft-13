$(document).ready(function(){ 
// This initialises carousels on the container elements specified, in this case, carousel1.
  $("#myCarousel").CloudCarousel({  
    xPos: 350,
    yPos: 32,
    buttonLeft: $("#left-but"),
    buttonRight: $("#right-but"),
    altBox: $("#alt-text"),
    titleBox: $("#title-text")
  });

  $(".cloudcarousel").tooltip({ placement: 'top' });
});

function save_start_page(project, task, page){
  $.ajax("/projects/"+ project + "/tasks/" + task + "/save_start_page/" + page);
}