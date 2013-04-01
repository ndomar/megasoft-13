function draw_circle() {
	$('#drag_resize').css({"display":"block" ,'top' : 0+'px', 'left' : 0+'px'});	
	$('#drag_resize').draggable( "enable");  
}

function create_note(top_pos, left_pos) {
	var offset = $('#drag_resize').offset();
	var top_pos =offset.top;
	var left_pos =offset.left;
	var notepaper_top =top_pos+ $('#drag_resize').height()/2;
	var notepaper_left =left_pos+ $('#drag_resize').width()/2;
	$('.note').css({"display":"block", 'top' : notepaper_top+'px', 'left' : notepaper_left+'px'});
	$('#drag_resize').draggable( "disable");  
}

function delete_circle() {
	$('#drag_resize').css({"display":"none"});		
}

function delete_all() {
	$('#drag_resize').css({"display":"none"});
	$('.note').css({"display":"none"});
}

function test_page(){
	//gets the page html from the database and goes to it to test it.
}

$(document).ready(function() {

	$("#drag_resize").resizable({
			maxHeight: 350,
			maxWidth: 350,
			minHeight: 150,
			minWidth: 200,
			animate: true,
			iframe: true,
			modal : true
		}).draggable({
			iframe: true,
			modal : true,
			containment: "#content",
			scroll: false
		});
});

