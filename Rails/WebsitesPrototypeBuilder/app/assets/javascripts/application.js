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
//= require jquery_nested_form
//= require bootstrap

var state=true;
var sidebar_width =20;
$(document).ready(function() {
  $("#slidebutton").click(function(){
    if(state){
    	$("#wrapper").animate({'padding-right' : 0}, 200);
      $("#sidebar").animate({'width':'0'},200);
      $('#slidebutton').animate({'margin-left' : '-40px'},{
        duration:200,
        step: function(now, fx) {
        	$('#slidebutton').css('transform','scaleX(-1)');
        }
      });
			state=false;
		}else{
      $("#wrapper").animate({'padding-right' : sidebar_width+'%'}, 200);
      $("#sidebar").animate({'width':sidebar_width+'%'},200);
      $('#slidebutton').animate({'margin-left' : '-9px'},{
        duration:200,
        step: function(now, fx) {
        	$('#slidebutton').css('transform','scaleX(1)');
        }
      });
		state=true;
	}});

var starting_position = $('#navigation_container').offset();
var top_padding = 0;
var bottom_limit = $('footer').offset();
var box_height = $('#side_content').height();
$(window).scroll(function(){
var top_window = $(window).scrollTop();
	if (top_window > starting_position.top && top_window < bottom_limit.top - box_height){
		$('#side_content').stop().animate({top: top_window - starting_position.top + top_padding}, 400);
	} else if (top_window > bottom_limit.top - starting_position.top - box_height){
		$('#side_content').stop().animate({top: bottom_limit.top - starting_position.top - box_height }, 400);
	} else {
		$('#side_content').stop().animate({top: 0 }, 400);
	}});

});