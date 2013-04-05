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
	changing();
}

function changing(){

}

function addPage(){
	document.write("entered");
	var input =window.prompt("Please enter Page Name","");
	//if(input != null){
		// <%= p = Page.new() %>		
		// <%= p.page_name = @param %>
		// <%= p.project_id = @id %>
		// <%= p.save() %>
	//}
}

// <script type="text/javascript">var x = window.prompt("Please enter Page Name","");
// 	   	 document.write(x);</script>