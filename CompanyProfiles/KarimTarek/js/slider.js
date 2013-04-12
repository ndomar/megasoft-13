$(document).ready(function(){
	$('.up1').click(function(){
		$('.part1').slideUp();
		$('.button1').css("visibility", "visible");
		$('.up1').css("visibility", "hidden");
	});
	
	$('.button1').click(function(){
		 $( ".part1" ).slideDown();
		 $('.button1').css("visibility", "hidden");
		 $('.up1').css("visibility", "visible");
	});
	
	///////////////////////////////////////////
	
		$('.up2').click(function(){
		$('.part2').slideUp();
		$('.button2').css("visibility", "visible");
		$('.up2').css("visibility", "hidden");
	});
	
	$('.button2').click(function(){
		 $( ".part2" ).slideDown();
		 $('.button2').css("visibility", "hidden");
		 $('.up2').css("visibility", "visible");
	});
	
	///////////////////////////////////////////
	
		$('.up3').click(function(){
		$('.part3').slideUp();
		$('.button3').css("visibility", "visible");
		$('.up3').css("visibility", "hidden");
	});
	
	$('.button3').click(function(){
		 $( ".part3" ).slideDown();
		 $('.button3').css("visibility", "hidden");
		 $('.up3').css("visibility", "visible");
	});
	
	///////////////////////////////////////////
	
});