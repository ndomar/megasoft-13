//these functions are used in the package explorer

//function to create iframes with their attributes
function createIframeWithContent(id,html){
	var frame=document.createElement("iframe");
	frame.setAttribute("id", id); 
	document.body.appendChild(frame);
 	//the second part is done separetly to make sure that iframe was created
  frame = document.getElementById(id);													//this is the iframe with the provided id
	var doc=(frame.contentWindow || frame.contentDocument);				//this is to make it compatible with different browsers
	if (doc.document)doc=doc.document;														//this is to make it compatible with different browsers
	doc.open();
	doc.write(html);
	doc.close();
	//those 3 steps are to write the html provided into the iframe selected
	// var script = this.contentWindow.document.createElement("script");
	// script.type = "text/javascript";
	// script.text  = 'if (document.all || document.getElementById) {for (i = 0; i < theform.length; i++) {var formElement = theform.elements[i];if (true) {formElement.disabled = true;}}}';
	// script to deactivate all actions
	// this.contentWindow.document.body.appendChild(script);
}

//function to alter the iframe with given id and fill it with given html
function addHtml(id,html){
	var frame = document.getElementById(id);											//this is the iframe with the provided id
	var doc=(frame.contentWindow || frame.contentDocument);				//this is to make it compatible with different browsers
	if (doc.document)doc=doc.document;														//this is to make it compatible with different browsers
	doc.open();
	doc.write(html);
	doc.close();
	// var script = this.contentWindow.document.createElement("script");
	// script.type = "text/javascript";
	// script.text  = 'if (document.all || document.getElementById) {for (i = 0; i < theform.length; i++) {var formElement = theform.elements[i];if (true) {formElement.disabled = true;}}}';
	//this script is to deactivate all actions within that html
	// this.contentWindow.document.body.appendChild(script);
}


