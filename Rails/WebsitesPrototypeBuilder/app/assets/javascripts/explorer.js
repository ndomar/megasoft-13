document.write("aaa");

//this is working efficently
// function adding()
// {
	
// 	var div = document.getElementById("div");
//   var btn=document.createElement("BUTTON");
// 	var t=document.createTextNode("CLICK ME");
// 	btn.appendChild(t); 
// 	document.body.appendChild(btn);
	
// }


function adding()
{
	
	var div = document.getElementById("div");
  var frame=document.createElement("iframe");
	var t=document.createTextNode("CLICK ME");
	frame.appendChild(t); 
	document.body.appendChild(frame);
	
}