$(document).ready(function (){

	$(".image-panel").css("right","20.2833px");

	$('#font_color_inp').ColorPicker({
	color: '#0000ff',
	onShow: function (colpkr) {
		$(colpkr).fadeIn(200);
		return false;
	},
	onHide: function (colpkr) {
		$(colpkr).fadeOut(200);
		return false;
	},
	onChange: function (hsb, hex, rgb) {
		$('#font_color_inp').css('backgroundColor', '#' + hex);
		$("#"+$("#eid_inp").val()).children().first().css("color",'#' + hex);
	}
});

	$(".toolboxelement").hover(function (e){
		$(this).animate({
			width: "+=10",
			height: "+=10"
		}, 100,"linear");
	}, function(){
		$(this).animate({
			width: "-=10",
			height: "-=10"
		}, 100,"linear");
	});

	$("#toolbox-tag").click(function(){
		if ($("#sidebar").css("right")=='0px'){
			$("#designcontainer").hide();
			$("#sidebar").animate({
				right: "-170px"
			},200,"linear");
			// $("#designpage").animate({
			// 	width: "+=200",
			// 	left: "+=200"
			// },300,"linear");
			// $("#designpage").children().animate({
			// 	left: "+=200"
			// },300,"linear");
		}
		else {
			if ($(".image-panel").css("right")=='-150px'){
				$("#image-panel-tag").click();
			}
			$("#sidebar").animate({
				right: "0px"
			},200,"linear");
			// $("#designpage").animate({
			// 	width: "-=200",
			// 	left: "-=200"
			// },300,"linear");
			// $("#designpage").children().animate({
			// 	left: "-=200"
			// },300,"linear");
			$("#designcontainer").show();
		}
	});

	$("#image-panel-tag").click(function(){
		if ($("#sidebar").css("right")=='0px'){
			$("#toolbox-tag").click();
			return;
		}
		if (parseFloat($(".image-panel").css('right') )> 20||$(".image-panel").css('right') == '1.5%'){
			$(".image-panel").animate({
				right: "-150px"
			},200,"linear");
			$("#designpage").animate({
				width: "+=170",
				left: "+=170"
			},200,"linear");
			$("#designpage").children().animate({
				left: "+=170"
			},200,"linear");
		}
		else {
			$(".image-panel").animate({
				right: "20.2833px"
			},200,"linear");
			$("#designpage").animate({
				width: "-=170",
				left: "-=170"
			},200,"linear");
			$("#designpage").children().animate({
				left: "-=170"
			},200,"linear");
		}
	});

	$("#save_event").click(function(){ //attach event to the element when the "Save Event" button is clicked
		if ($("#event_selector").val()=="onClick"){
			if ($("#action_selector").val()=="url"){
				$("#"+$("#eid_inp").val()).attr("onclickevent","window.location = "+$("#action_value").val()+";");
			}
			else{
				$("#"+$("#eid_inp").val()).attr("onclickevent","alert(\""+$("#action_value").val()+"\");");
			}
		}
		else if ($("#event_selector").val()=="onHover"){
			if ($("#action_selector").val()=="url"){
				$("#"+$("#eid_inp").val()).attr("onhoverevent","window.location = "+$("#action_value").val()+";");
			}
			else{
				$("#"+$("#eid_inp").val()).attr("onhoverevent","alert(\""+$("#action_value").val()+"\");");
			}
		}
		alert("تم حفظ الحدث بنجاح");
	});

	$(".inp").blur(function(){ //when one of the properties input boxes lose focus, try to apply the new entered value
		applyChangedProperty($(this));
	})
	.keypress(function(e) {
    	if(e.which == 13) {
        	applyChangedProperty($(this));
    	}
	});

	function applyChangedProperty(element){
		if (element.attr("property")=="text"){
			$("#"+$("#eid_inp").val()).children().first().text(element.val());
		}
		else{
			if (insideDesignPage($("#"+$("#eid_inp").val()),element.attr("property"),element.val())){
				$("#"+$("#eid_inp").val()).css(element.attr("property"),element.val());
			}
		}
		$("#"+$("#eid_inp").val()).click();
	}

	function exceedsWidth(element,val,left_pos){ //checks if the element exceeded the designpage width
		return element.outerWidth(true)+val>$("#designpage").width();
	}

	function exceedsHeight(element,val,top_pos){ //checks if the element exceeded the designpage height
		return element.outerHeight(true)+val>$("#designpage").height();
	}

	function insideDesignPage(element,property,val){ //applies the property with the new value to the component then checks if the element still resides in the designpage
		try{
			var pp = element.css(property);
			element.css(property,val);
			var pos = element.offset();
			pos.left-=$("#designpage").offset().left;
			pos.top-=$("#designpage").offset().top;
			if (pos.left>=0 && pos.left<=$("#designpage").width() && pos.top>=0 && pos.top<=$("#designpage").height() && pos.left+element.width()<=$("#designpage").width() && pos.top+element.height()<=$("#designpage").height() && element.outerWidth(true)<=$("#designpage").width() && element.outerHeight(true)<=$("#designpage").height() && parseInt(val)>=0){
				element.css(property,pp);
				return true;
			}
			else{
				element.css(property,pp);
				return false;
			}
		}
		catch(err){
			return false;
		}
	}

	counter = 0; //Counts number of elements in the Design Page

	$(".drag").draggable({

		helper: 'clone',// clone the dragged element and drag the newly created one
		containment: 'designpage',// elements should be contained in design page not any other element
		cancel:false,// drag action not overriten by any other actions (ex. button's onClick event)

		start: function (event,ui){
			counter++; //When dragging starts, increment the counter
			// $("#designpage").css("z-index","-1");
		},
		drag: function (event,ui){
			if (ui.helper.parent().attr("id")=="designpage"){
				ui.helper.css("color","black");
			}
			else{
				ui.helper.css("color","white");
			}
		},
		stop: function(event, ui){
			var pos = $(ui.helper).offset();
			var pos1 = $("#designpage").offset();
			var name = "#element"+counter; //new element's name

			$(name).css({ //set position of the new element
			"left": pos.left-pos1.left,
			"top": pos.top-pos1.top,
			});

			$(name).children().css({
				"width": "100%",
				"height": "100%"
			});

			if ($(name).parent().attr("id")!="designpage") { //if the element is dropped outside the design page remove it from the document and don't add it to the design page
				counter--;
				$(name).remove();
			}
			else{
				$(name).removeClass("drag");
				$(name).append('<i id = "close" class="icon-remove" style="top: 0px; right: 0px; position: absolute;"></i>');
				$(name).children("#close").click(function(){
					$(name).remove();
				});
				$(name).resizable({ //define resizable action for the new element
					containment: 'parent',
					alsoResize: $(name).children(".toolboxelement"),
				    cancel: false,
			        start: function(event, ui){
		  	    		ui.element.children(".toolboxelement").css({
		      				"width": "100%" ,
		       				"height": "100%"
	   		        	});
		            	ui.element.click();
			      	},
				    resize: function(event, ui){
			        	ui.element.children(".toolboxelement").css({
		       	  		"width": "100%" ,
		          		"height": "100%"
			       		});
			       		//if the resize exceeds the design page's width and height, stop the resize action (trying to fix the jquery-ui bug)
			        	if (exceedsWidth(ui.element,0,ui.position.left)){
			        		$(this).resizable('widget').trigger('mouseup');
			        		$(this).width($(this).width()-(ui.element.outerWidth(true)-$("#designpage").width()));
			        	}
			        	else if (exceedsHeight(ui.element,0,ui.position.top)){
			        		$(this).resizable('widget').trigger('mouseup');
			        		$(this).height($(this).height()-(ui.element.outerHeight(true)-$("#designpage").height()));
			        	}
			        	//update the properties "width" and "height" as the element is being resized
					    $("#width_inp").val(ui.size.width);
					    $("#height_inp").val(ui.size.height);
				    },
			        stop: function(event, ui){
					      ui.element.children(".toolboxelement").css({
			         	  "width": "100%" ,
			     	      "height": "100%"
				        });
			        }
				})
				.draggable({ //new draggable to avoid cloning elements that are moved within the design page
					containment: 'parent',
					cancel:false,

					start: function(event, ui){
						ui.helper.click();
					},

					drag: function(event, ui){ //update the properties "left" and "right" as the element is being moved
						$("#left_inp").val(ui.position.left+"px");
				   	$("#top_inp").val(ui.position.top+"px");
					}

				})
				.click(function() {	//click function to show the properties of the element in the properties panel

					$(".properties").css("visibility","visible");
					var eid = $(this).attr("id");
					$("#eid_inp").val(eid);
					$("#text_inp").val($(this).children().first().text());
					$("#width_inp").val($(this).width());
					$("#height_inp").val($(this).height());
					$("#margin_left_inp").val($(this).css("margin-left"));
					$("#margin_right_inp").val($(this).css("margin-right"));
					$("#margin_top_inp").val($(this).css("margin-top"));
					$("#margin_bottom_inp").val($(this).css("margin-bottom"));
					$("#top_inp").val($(this).position().top+"px");
					$("#left_inp").val($(this).position().left+"px");
					$("#font_color_inp").css("background-color",$(this).children().first().css("color"));
				})
				.hover(function(){
					var close = $(this).children("#close");
					close.css("visibility","visible");
				}, function(){
					var close = $(this).children("#close");
					close.css("visibility","hidden");
				})
				.dblclick(function() {
					$(this).children().first().attr("contenteditable","true");
				});

				$(name).click();		
			}
		}
	});

	$("#designpage").droppable({
		tolerance: 'fit',
		drop: function(event, ui){
			if (ui.draggable.attr('id').search(/element([0-9])/)==-1){ // if it is not an already dragged element
				var element = $(ui.draggable).clone(); // clone the dragged element
				element.attr("id","element"+counter); // change its id
				element.addClass("appended"); // give it class appended
				$(this).append(element); // add the element to the design page (writing html code to the div)
			}
		}
	});
});

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

var files;
var i;
var dropArea;

function dropHandler(evt){
	noopHandler(evt);
	files = evt.dataTransfer.files;
	i = 0;
	var dropArea = $('#drop-area');
	$(dropArea).text("");
	$(dropArea).append("<label id='file-name'/>");
	$(dropArea).append("جارى التحميل");
	$("<br/>").appendTo(dropArea);
	$('<progress id="upload-progress" max="100" value="0"/>').appendTo("#drop-area");
	processFile();	
}

function showImage(file){
	var reader = new FileReader();
	reader.onload = function(evt) {
		var code = "<div class='thumbnail'>" + 
							 "<img  src='" + evt.target.result + "' />" + 
							 "</div>";
		$(code).prependTo("#image-panel");
	}
	reader.readAsDataURL(file);
}

function processFile(){
	if (i == files.length){
		$('#drop-area').text("ارمى صورة هنا لرفعها");
		return;
	}
	if (files[i].type.indexOf("image") != 0){
		alert("Only image files allowed");
		i++;
		processFile();
	}
	$('#file-name').text(files[i].name);
	var progress = parseInt(((i+1) / files.length * 100));
	$("#upload-progress").attr("value", progress);
	uploadFile(files[i]);
	i++;
}

function uploadFile(file){
	project_id = document.project.elements['project_id'].value;
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(evt) {
		if (xhr.readyState == 4 ){
			if (xhr.status == 201)
				showImage(files[i-1]);
			processFile();
		}
	};
	xhr.open("POST", "/projects/upload_media", true);
	xhr.setRequestHeader("X_FILENAME", file.name);
	xhr.setRequestHeader("PROJECT_ID", project_id);
	xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
	xhr.send(file);
}