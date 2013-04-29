$('<iframe id="preview_mode"/>').load(function(){
	// Write your iframe javascript here
  $('#preview_mode').contents().find('body').append('<script>$(function() {alert("hello from jquery");console.log("My javascript"); })<\/script>');
  
}).appendTo("body");