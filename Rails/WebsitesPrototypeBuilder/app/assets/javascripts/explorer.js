//function to be used when i need to add an item to any item
// function adding(){	
// 	var div = document.getElementById("div");
//   var btn=document.createElement("BUTTON");
// 	var t=document.createTextNode("CLICK ME");
// 	btn.appendChild(t); 
// 	document.body.appendChild(btn);
// }

//function to create iframes with their attributes
function createIframeWithContent(id,html){
	document.write("Step -1");
	var frame=document.createElement("iframe");
	frame.setAttribute("id", id); 
	document.body.appendChild(frame);
	document.write("Step 0");
 	//the second part is done separetly to make sure that iframe was created
  frame = document.getElementById(id);													//this is the iframe with the provided id
	var doc=(frame.contentWindow || frame.contentDocument);				//this is to make it compatible with different browsers
	if (doc.document)doc=doc.document;														//this is to make it compatible with different browsers
	document.write("Step 1");
	doc.open();
	doc.write(html);
	doc.close();
	document.write("Step 2");
	var script = this.contentWindow.document.createElement("script");
	script.type = "text/javascript";
	script.text  = 'if (document.all || document.getElementById) {for (i = 0; i < theform.length; i++) {var formElement = theform.elements[i];if (true) {formElement.disabled = true;}}}';
	// script to deactivate all actions
	this.contentWindow.document.body.appendChild(script);

	document.write("FINISHED CREATION");
}

//function to alter the iframe with given id and fill it with given html
function addHtml(id,html){
	var frame = document.getElementById(id);											//this is the iframe with the provided id
	var doc=(frame.contentWindow || frame.contentDocument);				//this is to make it compatible with different browsers
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

//function used to retrieve name of new page to be created
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

