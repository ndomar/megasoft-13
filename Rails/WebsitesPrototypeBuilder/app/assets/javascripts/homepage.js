// slide the login form
$(document).ready(function sliding_form(){
  $('.login_image').click(function(){
    if ($(".login_form").is(":hidden")){
      $(".login_form").show("medium");
    }
    else{
      $(".login_form").hide("fast");
    }
  });        
});


