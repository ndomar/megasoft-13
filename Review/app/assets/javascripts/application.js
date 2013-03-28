// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .

//Using jquery-ui to drag and resize the circle
function draw_circle() {
	$('#drag_resize').css({"display":"block" ,'top' : 0+'px', 'left' : 0+'px'});	
	$('#drag_resize').draggable( "enable");  
}

// Make the notepaper visible and set it position
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