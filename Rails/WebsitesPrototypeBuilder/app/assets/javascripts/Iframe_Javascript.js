$('<iframe id="preview_mode"/>').load(function(){
	// Write your iframe javascript here
  $('#preview_mode').contents().find('body').append('<script>$(document).ready(function() {alert("call paerent");parent.test();});<\/script>');
  
}).appendTo("body");


function test(){
	alert("reice");
}

function callChild(){
var iframe = document.getElementById("preview_mode");
if (iframe) {
   var iframeContent = (iframe.contentWindow || iframe.contentDocument);
   iframeContent.fd();
}
}
