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
	document.write("ADDING IFRAME");
	//var div = document.getElementById("div");
  var frame=document.createElement("div");
  var doc = frame.contentDocument;
  doc.open();
  doc.write("<p>dsasda</p>");
  doc.close();
	//var t=document.createTextNode("CLICK ME");
	//frame.appendChild(t); 
	document.body.appendChild(frame);
	// changing();
}

function addHtml(id,html){
	var frame = document.getElementById(id);								//this is the iframe with the provided id
	var doc=(frame.contentWindow || frame.contentDocument);		//this is to make it compatible with different browsers
	if (doc.document)doc=doc.document;														//this is to make it compatible with different browsers
	doc.open();
	doc.write(html);
	doc.close();
	var script = this.contentWindow.document.createElement("script");
	script.type = "text/javascript";
	script.text  = 'if (document.all || document.getElementById) {for (i = 0; i < theform.length; i++) {var formElement = theform.elements[i];if (true) {formElement.disabled = true;}}}';
	// script to deactivate all actions
	this.contentWindow.document.body.appendChild(script);
}

// function addHtml(id,html){
// 	document.write("1");
// 	var doc = document.getElementById(id);
// 	 //var doc = $(this).contentWindow.document;
// 	// document.write("2");
// 	// doc.open();
// 	// document.write("3");
// 	// doc.write(html);
// 	// document.write("4");
// 	// doc.close();
// 	// document.write("5");
// 	// var script = this.contentWindow.document.createElement("script");
// 	// document.write("6");
// 	// script.type = "text/javascript";
// 	// document.write("7");
// 	// script.text  = 'if (document.all || document.getElementById) {for (i = 0; i < theform.length; i++) {var formElement = theform.elements[i];if (true) {formElement.disabled = true;}}}';
// 	// document.write("8");
// 	// // script to deactivate all actions
// 	// this.contentWindow.document.body.appendChild(script);
// 	document.write("9");
// }

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