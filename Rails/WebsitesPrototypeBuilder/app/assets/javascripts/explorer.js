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


function addingIFrame()
{
	var div = document.getElementById("div");
  var frame=document.createElement("iframe");
	var t=document.createTextNode("CLICK ME");
	frame.appendChild(t); 
	document.body.appendChild(frame);
	changing();
}

function addHtml(id,html){
	var doc = this.contentWindow.document;
	doc.open();
	doc.write(html);
	doc.close();
	var script = this.contentWindow.document.createElement("script");
	script.type = "text/javascript";
	script.text  = 'if (document.all || document.getElementById) {for (i = 0; i < theform.length; i++) {var formElement = theform.elements[i];if (true) {formElement.disabled = true;}}}';
	// script to deactivate all actions
	this.contentWindow.document.body.appendChild(script);};
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