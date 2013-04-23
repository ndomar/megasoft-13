// slide the login form
$(document).ready(function sliding_form(){
  $('.login_image').click(function(){
		var offset = $(".login_image").offset();
		var top_pos =offset.top;
		var left_pos =offset.left;
		$('.login_form').css({'top' : (top_pos)+'px', 'left' : (left_pos+40)+'px'});
  	if ($(".login_form").is(":hidden")){
    	$(".login_form").show("medium");
  	}
  	else{
    	$(".login_form").hide("fast");
  	}
  }
 );        
});


 // This is a functions that scrolls to #{blah}link
function goToByScroll(id){
      // Remove "link" from the ID
    id = id.replace("link", "");
      // Scroll
    $('html,body').animate({
        scrollTop: $("#"+id).offset().top},
        'slow');
}

$(".navbar-inner foot > ul > li > a").click(function(e) { 
      // Prevent a page reload when a link is pressed
    e.preventDefault(); 
      // Call the scroll function
    goToByScroll($(this).attr("id"));           
});