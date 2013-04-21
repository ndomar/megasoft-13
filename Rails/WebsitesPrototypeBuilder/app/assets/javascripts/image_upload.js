function initDragAndDrop() {
	var dragArea = document.getElementById("drop-area");
	dragArea.addEventListener("dragover", noopHandler, false);
	dragArea.addEventListener("dragenter", noopHandler, false);
	dragArea.addEventListener("dragleave", noopHandler, false);
	dragArea.addEventListener("drop", dropHandler, false);
}

function noopHandler(evt){
	evt.stopPropagation();
	evt.preventDefault();
}

function dropHandler(evt){
	noopHandler(evt);
	var files = evt.dataTransfer.files;
	for (var i = 0; i < files.length; i++){
		uploadFile(files[i]);
	}
}

function uploadFile(file){
	//check for file type
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "upload_image", true);
	xhr.setRequestHeader("X_FILENAME", file.name);
	xhr.send(file);
	alert("sd");
}