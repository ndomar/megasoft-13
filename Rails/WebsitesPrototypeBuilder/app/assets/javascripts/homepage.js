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
  //slide to who are we div (middel page)
  $('.center').click(function(){
    $('html,body').animate({
      scrollTop: $("#who_are_we").offset().top},
      600);
  });
  //slide to the 1st page
  $('.right').click(function(){
    $('html,body').animate({
      scrollTop: $("#slide").offset().top},
      600);
  });
  //slide to the glimpse page (last page)
  $('.left').click(function(){
    $('html,body').animate({
      scrollTop: $("#glimpse").offset().top},
      600);
  });
});







