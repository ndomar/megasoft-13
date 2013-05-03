/ This is a manifest file that'll be compiled into application.js, which will include all the files
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
//= require twitter/bootstrap/rails/confirm

//The state of the side-bar(collapsed or opened)
var state=true;
var sidebar_width =320;
$(document).ready(function() {
  // USed to slide the side-bar
  $("#slidebutton").click(function(){
    if(state){
      $('#myiframe').contents().find('.nom').hide();
      $('#drag_resize').css({"display":"none"});
    	$("#wrapper").animate({'padding-right' : 0}, 600);
      $("#sidebar").animate({'width':'0'},600);
      $("#side_content").slideUp("fast");
      $('#slidebutton').animate({'margin-left' : '-40px'},{
        duration:600,
        step: function(now, fx) {
        	$('#slidebutton').css('transform','scaleX(-1)');
        }
      });
			state=false;
		}else{
      $('#myiframe').contents().find('.nom').hide();
      $('#drag_resize').css({"display":"none"});
      $("#wrapper").animate({'padding-right' : sidebar_width+'px'}, 600);
      $("#side_content").slideDown("fast");
      $("#sidebar").animate({'width':sidebar_width+'px'},600);
      $('#slidebutton').animate({'margin-left' : '-9px'},{
        duration:600,
        step: function(now, fx) {
        	$('#slidebutton').css('transform','scaleX(1)');
        }
      });
		state=true;
	}});


});
