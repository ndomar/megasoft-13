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
	if (file.type.indexOf("image") != 0){
		alert("Only image files allowed");
	}
	project_id = document.project.elements['project_id'].value;
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "upload_image", true);
	xhr.setRequestHeader("X_FILENAME", file.name);
	xhr.setRequestHeader("PROJECT_ID", project_id);
	xhr.send(file);
}