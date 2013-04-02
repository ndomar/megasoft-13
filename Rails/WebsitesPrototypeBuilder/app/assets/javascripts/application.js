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
	$('#choose_area').css({"display":"table-cell"});
	$('#delete_circle').css({"display":"table-cell"});
}

// Make the notepaper visible and set it position
function create_note() {
	var offset = $('#drag_resize').offset();
	var top_pos =offset.top;
	var left_pos =offset.left;
	var notepaper_top =top_pos + $('#drag_resize').height()/2;
	var notepaper_left =left_pos + $('#drag_resize').width()/2;
	$('.note').css({"display":"block", 'top' : notepaper_top+'px', 'left' : notepaper_left+'px'});
	$('#drag_resize').draggable( "disable");  
	$('#choose_area').css({"display":"none"});
	$('#delete_circle').css({"display":"none"});
}

// delete The selecting circle
function delete_circle() {
	$('#drag_resize').css({"display":"none"});
}

// delete The selecting circle and the notepaper
function delete_all() {
	$('#drag_resize').css({"display":"none"});
	$('.note').css({"display":"none"});
}

// It takes the id and the object from the Iframe and set the assignedpart value to it.
function getSelectedItem(elementId,elementObj){
	var id=elementId;
	var theobj=elementObj;
	document.getElementById('assignedpart').value=elementId;
}

// Send circle location to the Iframe
function selectItem () {
	var element = document.getElementById('drag_resize');
	var isVisible = element.offsetWidth > 0 || element.offsetHeight > 0;
	if(isVisible){
		var offset = $('#drag_resize').offset();
		var posY =offset.top + ($('#drag_resize').height()/2) -51 ;
		var posX =offset.left+ ($('#drag_resize').width()/2);
		window.frames[0].OnMouseMove(posX,posY);
	}
}

// Called when started to add the content to the iframe and make the circle draggable and resizable.
$(document).ready(function() {
	//Load the html from the database through the hidden div with id "html_content"
	var designed_html= $('#html_content').text();
	var doc = document.getElementById('myiframe').contentWindow.document;
	doc.open();
	// Write the fetched html to the iframe with id "myiframe"
	doc.write(designed_html);
	doc.close();

	//selecting the iframe and appeding the script for selecting thr item behind the circle and draw the border around the selected item.
	var myIframe = document.getElementById("myiframe");
	var script = myIframe.contentWindow.document.createElement("script");
	script.type = "text/javascript";
	script.text  = 'var selElem = null;var origBorder = "";function OnMouseMove (circleX,circleY) {var posX = circleX, posY = circleY;var overElem = document.elementFromPoint (posX, posY);if (overElem && overElem.tagName === undefined) {overElem = overElem.parentNode;	}if (selElem) {if (selElem == overElem) {return;}selElem.style.border = origBorder;selElem = null;}if (overElem && overElem.tagName.toLowerCase () != "body" && overElem.tagName.toLowerCase () != "html") {selElem = overElem;	origBorder = overElem.style.border;overElem.style.border = "1px dashed gray";}parent.getSelectedItem(selElem.id,selElem);}';
	myIframe.contentWindow.document.body.appendChild(script);
	// Make the selecting circle resizable and draggable
	$("#drag_resize").resizable({
			maxHeight: 350,
			maxWidth: 350,
			minHeight: 60,
			minWidth: 100,
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