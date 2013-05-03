var nStates = 3 + 1;
var tabState = nStates-1;

$(document).ready(function (){

	var enter_leave = false;

	$("#font_weight_inp").change(function(){
		if ($("#font_weight_inp").prop('checked')==false) {
			$("#"+$("#eid_inp").val()).children().first().css("font-weight",400);
		}
		else{
			$("#"+$("#eid_inp").val()).children().first().css("font-weight",700);
		}
	});

	$("#font_style_inp").change(function(){
		if ($("#font_style_inp").prop('checked')==false) {
			$("#"+$("#eid_inp").val()).children().first().css("font-style","normal");
		}
		else{
			$("#"+$("#eid_inp").val()).children().first().css("font-style","italic");
		}
	});

	$("#text_align_inp").change(function(){
		$("#"+$("#eid_inp").val()).children().first().css("text-align",$("#text_align_inp").val());
	});

	$("#border_inp").change(function(){
		if ($("#"+$("#eid_inp").val()).hasClass("bordiv")){
			$("#"+$("#eid_inp").val()).css("border",$("#border_inp").val());
		}
		else {
			$("#"+$("#eid_inp").val()).children().first().css("border",$("#border_inp").val());
		}
	});

	$("#font_family_inp").change(function(){
		$("#"+$("#eid_inp").val()).children().first().css("font-family",$("#font_family_inp").val());
	});

	$(".up_images").draggable({
			appendTo: $("#designpage"),
			helper: function( event ) {
        				return $( "<div class='ui-widget-header' style='position: relative;z-index: 10000000;'><img src='/assets/image_icon.png' width='50' height='50' style='position: relative; z-index: 10000000;' /></div>" );
      				},
      		zIndex: 10000000,
      		cursorAt: {left: 0, top: 20}
	});

	$("#designpage").gridBuilder({
    	color:          '#eee',    // color of the primary gridlines
    	secondaryColor: '#f9f9f9', // color of the secondary gridlines
    	vertical:       20,        // height of the vertical rhythm
    	horizontal:     20,       // width of horizontal strokes
    	gutter:         0        // width of the gutter between strokes
	  });
	// .width($("#content").width());

/*
	$(".properties").blur(function () {
		$(".properties").css("visibility","hidden");
	});
*/
	$('#content').click(function(e){
	    $('.properties').css("visibility","hidden");
	    $('.text_prop').css("visibility","hidden");
	    $('.hyper_prop').css("visibility","hidden");
 	});


	$( "#accordion" ).accordion({
  		collapsible: true,
  		active:false,
  		header: "h6"
	})
	.removeClass("ui-helper-reset")
	.css({
		"display": "block",
		"padding": "0px",
		"border": "0px",
		"outline": "0px",
		"line-height": "1.3px",
		"text-decoration": "none",
		"list-style": "none",
		"width": "210px",
		"margin-top": "30px",
		"margin-right": "10px"
	});

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

	$('#border_color_inp').ColorPicker({
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
		$('#border_color_inp').css('backgroundColor', '#' + hex);
		if ($("#"+$("#eid_inp").val()).hasClass("bordiv")){
			$("#"+$("#eid_inp").val()).css("border-color",'#' + hex);
		}
		else{
			$("#"+$("#eid_inp").val()).children().first().css("border-color",'#' + hex);
		}
	}
	});

	$(".drag").hover(function (e){
		// alert("entered");
		if (!enter_leave){
			$(this).animate({
				width: "+=10",
				height: "+=10"
			}, 100,"linear");
			enter_leave = true;
		}
	}, function(){
		// alert("left");
		if (enter_leave){
			$(this).animate({
				width: "-=10",
				height: "-=10"
			}, 100,"linear");
			enter_leave = false;
		}
	});

	$("#toolbox-tag").click(function(){
		if (tabState == nStates-1){
			tabState--;
			$("#designcontainer").hide();
			$("#sidebar").animate({
				right: "-170px"
			},200,"linear");
		}
		else {
			if (tabState == nStates-3){
				$("#image-panel-tag").click();
			}else if(tabState == nStates-4){
				$("#versions-panel-tag").click();
				$("#image-panel-tag").click();
			}
			tabState = nStates-1;
			$("#sidebar").animate({
				right: "0px"
			},200,"linear");
			$("#designcontainer").show();
		}
	});

	$("#image-panel-tag").click(function(){
		if (tabState == nStates-1){
			$("#toolbox-tag").click();
			return;
		}
		if (tabState == nStates-2){
			tabState--;
			$(".image-panel").animate({
				right: "-150px"
			},200,"linear");
		}
		else {
			if(tabState == nStates-4){
				$("#versions-panel-tag").click();
				$("#image-panel-tag").click();
			}
			tabState = nStates-2;
			$(".image-panel").animate({
				right: "20.2833px"
			},200,"linear");
		}
	});

	$("#versions-panel-tag").click(function(){
		if (tabState == nStates-1){
			$("#toolbox-tag").click();
			return;
		} else if (tabState == nStates-2){
			$("#image-panel-tag").click();
			return;
		}
		if (tabState == nStates-3){
			tabState--;
			$("#versions-scroll").hide();
			$(".versions-panel").animate({
				right: "-130px"
			},200,"linear");
			tabsArea(false);
		}
		else {
			tabsArea(true);

			tabState = nStates-3
			$(".versions-panel").animate({
				right: "40px"
			},200,"linear");
			
			$("#versions-scroll").show();	
		}
	});

	$("#save_event").click(function(event){ //attach event to the element when the "Save Event" button is clicked
		event.stopPropagation();
		if ($("#event_selector").val()=="onClick"){
			if ($("#action_selector").val()=="url"){
				$("#"+$("#eid_inp").val()).attr("onclickevent","window.location = "+$("#action_value").val()+";");
			}
			else if ($("#action_selector").val()=="message"){
				$("#"+$("#eid_inp").val()).attr("onclickevent","alert(\""+$("#action_value").val()+"\");");
			}
			// else{
			// 	$("#"+$("#eid_inp").val()).attr("onclickevent","window.location = "+$("#action_value").val()+";");
			// }
		}
		else if ($("#event_selector").val()=="onHover"){
			if ($("#action_selector").val()=="url"){
				$("#"+$("#eid_inp").val()).attr("onhoverevent","window.location = "+$("#action_value").val()+";");
			}
			else if ($("#action_selector").val()=="message"){
				$("#"+$("#eid_inp").val()).attr("onhoverevent","alert(\""+$("#action_value").val()+"\");");
			}
		}
		alert("تم حفظ الحدث بنجاح");
		return false;
	});

	$(".inp").blur(function(){ //when one of the properties input boxes lose focus, try to apply the new entered value
		applyChangedProperty($(this));
	})
	.keypress(function(e) {
    	if(e.which == 13) {
        	applyChangedProperty($(this));
    	}
	});


	function tabsArea(enable){
		if(enable){
	    	$("#designpage").animate({
	        	width: "-=170",
	            left: "-=170"
	       	},200,"linear");
	       	$("#designpage").children().animate({
	        	left: "-=170"
	       	},200,"linear");
	    }else{
	    	$("#designpage").animate({
	        	width: "+=170",
	            left: "+=170"
	       	},200,"linear");
	       	$("#designpage").children().animate({
	        	left: "+=170"
	       	},200,"linear");
	    }
	}

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
			ui.helper.css("border-color","black");
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
				$(name).append('<i id = "close" class="icon-remove" style="top: 0px; left: 0px; position: absolute;"></i>');
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
						$("#left_inp").val(ui.position.left);
				   		$("#top_inp").val(ui.position.top);
					}

				})
				.click(function(event) {	//click function to show the properties of the element in the properties panel
					event.stopPropagation();
					$(".properties").css("visibility","visible");
					$('.text_prop').css("visibility","hidden");
	    			$('.hyper_prop').css("visibility","hidden");		
					var eid = $(this).attr("id");
					$("#eid_inp").val(eid);
					$("#top_inp").val(parseInt($(this).position().top+"px"));
					$("#left_inp").val(parseInt($(this).position().left+"px"));
					$("#width_inp").val(parseInt($(this).width()));
					$("#height_inp").val(parseInt($(this).height()));
					$("#margin_left_inp").val(parseInt($(this).css("margin-left")));
					$("#margin_right_inp").val(parseInt($(this).css("margin-right")));
					$("#margin_top_inp").val(parseInt($(this).css("margin-top")));
					$("#margin_bottom_inp").val(parseInt($(this).css("margin-bottom")));
					if ($(this).hasClass("bordiv")){
						$("#border_radius_inp").val(parseInt($(this).css("border-radius")));
						$("#border_width_inp").val(parseInt($(this).css("border-width")));
						$("#border_color_inp").css("background-color",$(this).css("border-color"));
					}
					else{
						$("#border_radius_inp").val(parseInt($(this).children().first().css("border-radius")));
						$("#border_width_inp").val(parseInt($(this).children().first().css("border-width")));
						$("#border_color_inp").css("background-color",$(this).children().first().css("border-color"));
					}
					if ($(this).hasClass("text")) {
						$(".text_prop").css("visibility","visible");
						$("#text_inp").val($(this).children().first().text().trim());
						$("#font_size_inp").val(parseInt($(this).css("font-size")));
						$("#font_color_inp").css("background-color",$(this).children().first().css("color"));
						$("#text_align_inp").val($(this).children().first().css("text-align"));
						$("#vertical_align_inp").val($(this).children().first().css("vertical-align"));
						$("#font_family_inp").val($(this).children().first().css("font-family"));
						if ($(this).children().first().css("font-weight")==700 || $(this).children().first().css("font-weight")=="bold"){
							$("#font_weight_inp").prop('checked', true);
						}
						else {
							$("#font_weight_inp").prop('checked', false);
						}
						if ($(this).children().first().css("font-style")=="italic"){
							$("#font_style_inp").prop('checked', true);
						}
						else {
							$("#font_style_inp").prop('checked', false);
						}
					}
					if ($(this).hasClass("hyper")){
						$(".hyper_prop").css("visibility","visible");
						$("#href_inp").val($(this).children().first().attr("href"));
					}
				})
				.hover(function(){
					var close = $(this).children("#close");
					close.css("visibility","visible");
				}, function(){
					var close = $(this).children("#close");
					close.css("visibility","hidden");
				})

				if ($(name).hasClass("img_ph")){
					$(name)[0].addEventListener("dragover", noopHandler, false);
					$(name)[0].addEventListener("dragenter", noopHandler, false);
					$(name)[0].addEventListener("dragleave", noopHandler, false);
					$(name)[0].addEventListener("drop", dragOutsideImage, false);
					$(name).droppable({
						accept: ".up_images",
						greedy: true,
						drop: function(event, ui){
							// alert(ui.draggable.children().first().attr("src"));
							// $(this).children().first().attr("src",event.data.value);
							// alert(ui.draggable.children().first().attr("src"));
							$(name).children().first().attr("src",ui.draggable.children().first().attr("src"));
						}
					});
				}

				if ($(name).hasClass("text")){
					$(name).children().first().attr("contenteditable",true);
					$(name).dblclick(function() {
						$(this).draggable("disable");
						$(this).children().first().attr("contenteditable",true);
						$(this).children().first().focus();
					});
					$(name).children().first().focusout(function(){
        				$(this).parent().draggable("enable");
        				$(this).parent().click();
        				if (!$(this).hasClass("btn")){
        					$(this).attr("contenteditable",false);
        				}
					});
				}

				$(name).click();		
			}
		}
	});

	$("#designpage").droppable({
		tolerance: 'fit',
		drop: function(event, ui){
			if (typeof ui.draggable.attr('id') != "undefined" && ui.draggable.attr('id').search(/element([0-9])/)==-1){ // if it is not an already dragged element
				var element = $(ui.draggable).clone(); // clone the dragged element
				element.attr("id","element"+counter); // change its id
				counter++;
				element.attr("id","element"+counter);
				element.addClass("appended"); // give it class appended
				$(this).append(element); // add the element to the design page (writing html code to the div)
			}
		}
	});
});

function applyChangedProperty(element){
	if (element.attr("property")=="text"){
		$("#"+$("#eid_inp").val()).children().first().text(element.val());
		$("#"+$("#eid_inp").val()).children().first().val(element.val());
	}
	else{
		switch (element.attr("id")){
			case "width_inp":
			case "height_inp":
			case "top_inp":
			case "left_inp":
			case "margin_left_inp":
			case "margin_right_inp":
			case "margin_top_inp":
			case "margin_bottom_inp": 
				if (insideDesignPage($("#"+$("#eid_inp").val()),element.attr("property"),element.val()+"px")){
					$("#"+$("#eid_inp").val()).css(element.attr("property"),element.val()+"px");
				}
				break;
			case "border_width_inp":
			case "border_radius_inp":
				if ($("#"+$("#eid_inp").val()).hasClass("bordiv")){
					$("#"+$("#eid_inp").val()).css(element.attr("property"),element.val()+"px");
				}
				else{
					$("#"+$("#eid_inp").val()).children().first().css(element.attr("property"),element.val()+"px");
				}
				break;
			case "font_size_inp":
				$("#"+$("#eid_inp").val()).children().first().css("font-size",element.val()+"px");
				break;
			case "href_inp":
				$("#"+$("#eid_inp").val()).children().first().attr("href",element.val());
				break;
			default: 
				if (insideDesignPage($("#"+$("#eid_inp").val()),element.attr("property"),element.val())){
					$("#"+$("#eid_inp").val()).css(element.attr("property"),element.val());
				}
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
	// alert("HEY DROP HANDLE");
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
	// alert("SHOW");
	var reader = new FileReader();
	reader.onload = function(evt) {
		var code = "<div class='thumbnail up_images'>" + 
							 "<img  src='" + evt.target.result + "' />" + 
							 "</div>";
		$(code).prependTo("#image-panel");
		$(".up_images").draggable({
			appendTo: $("#designpage"),
			helper: function( event ) {
        				return $( "<div class='ui-widget-header' style='position: relative;z-index: 10000000;'><img src='/assets/image_icon.png' width='50' height='50' style='position: relative; z-index: 10000000;' /></div>" );
      				},
      		zIndex: 10000000,
      		cursorAt: {left: 0, top: 20}
		});
	}
	reader.readAsDataURL(file);
}

function processFile(){
	// alert("HEY PROCESS");
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
		// alert("HEY UPLOAD");
		if (xhr.readyState == 4 ){
			// alert("INISE 1");
			// alert("STATUS: "+xhr.status);
			if (xhr.status == 201){
				showImage(files[i-1]);
				// alert("HEY INSIDE");
			}
			processFile();
		}
	};
	xhr.open("POST", "/projects/upload_media", true);
	xhr.setRequestHeader("X_FILENAME", file.name);
	xhr.setRequestHeader("PROJECT_ID", project_id);
	xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
	xhr.send(file);
}

function applyInterfaces(){
	applyInterfacesHelper($("#designpage").children());
}

function applyInterfacesHelper(list){
	
	for (var i = 0; i<list.length; i++){
		var ele = list.eq(i);
		ele.append('<i id = "close" class="icon-remove" style="top: 0px; left: 0px; position: absolute;"></i>');
				ele.children("#close").click(function(){
					ele.remove();
				});
				ele.resizable({ //define resizable action for the new element
					containment: 'parent',
					alsoResize: ele.children(".toolboxelement"),
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
						$("#left_inp").val(ui.position.left);
				   		$("#top_inp").val(ui.position.top);
					}

				})
				.click(function(event) {	//click function to show the properties of the element in the properties panel
					event.stopPropagation();
					$(".properties").css("visibility","visible");
					$('.text_prop').css("visibility","hidden");
	    			$('.hyper_prop').css("visibility","hidden");		
					var eid = $(this).attr("id");
					$("#eid_inp").val(eid);
					$("#top_inp").val(parseInt($(this).position().top+"px"));
					$("#left_inp").val(parseInt($(this).position().left+"px"));
					$("#width_inp").val(parseInt($(this).width()));
					$("#height_inp").val(parseInt($(this).height()));
					$("#margin_left_inp").val(parseInt($(this).css("margin-left")));
					$("#margin_right_inp").val(parseInt($(this).css("margin-right")));
					$("#margin_top_inp").val(parseInt($(this).css("margin-top")));
					$("#margin_bottom_inp").val(parseInt($(this).css("margin-bottom")));
					if ($(this).hasClass("bordiv")){
						$("#border_radius_inp").val(parseInt($(this).css("border-radius")));
						$("#border_width_inp").val(parseInt($(this).css("border-width")));
						$("#border_color_inp").css("background-color",$(this).css("border-color"));
					}
					else{
						$("#border_radius_inp").val(parseInt($(this).children().first().css("border-radius")));
						$("#border_width_inp").val(parseInt($(this).children().first().css("border-width")));
						$("#border_color_inp").css("background-color",$(this).children().first().css("border-color"));
					}
					if ($(this).hasClass("text")) {
						$(".text_prop").css("visibility","visible");
						$("#text_inp").val($(this).children().first().text().trim());
						$("#font_size_inp").val(parseInt($(this).css("font-size")));
						$("#font_color_inp").css("background-color",$(this).children().first().css("color"));
						$("#text_align_inp").val($(this).children().first().css("text-align"));
						$("#vertical_align_inp").val($(this).children().first().css("vertical-align"));
						$("#font_family_inp").val($(this).children().first().css("font-family"));
						if ($(this).children().first().css("font-weight")==700 || $(this).children().first().css("font-weight")=="bold"){
							$("#font_weight_inp").prop('checked', true);
						}
						else {
							$("#font_weight_inp").prop('checked', false);
						}
						if ($(this).children().first().css("font-style")=="italic"){
							$("#font_style_inp").prop('checked', true);
						}
						else {
							$("#font_style_inp").prop('checked', false);
						}
					}
					if ($(this).hasClass("hyper")){
						$(".hyper_prop").css("visibility","visible");
						$("#href_inp").val($(this).children().first().attr("href"));
					}
				})
				.hover(function(){
					var close = $(this).children("#close");
					close.css("visibility","visible");
				}, function(){
					var close = $(this).children("#close");
					close.css("visibility","hidden");
				})

				if (ele.hasClass("img_ph")){
					ele[0].addEventListener("dragover", noopHandler, false);
					ele[0].addEventListener("dragenter", noopHandler, false);
					ele[0].addEventListener("dragleave", noopHandler, false);
					ele[0].addEventListener("drop", dragOutsideImage, false);
					ele.droppable({
						accept: ".up_images",
						greedy: true,
						drop: function(event, ui){
							// alert(ui.draggable.children().first().attr("src"));
							// $(this).children().first().attr("src",event.data.value);
							// alert(ui.draggable.children().first().attr("src"));
							ele.children().first().attr("src",ui.draggable.children().first().attr("src"));
						}
					});
				}

				if (ele.hasClass("text")){
					ele.children().first().attr("contenteditable",true);
					ele.dblclick(function() {
						$(this).draggable("disable");
						$(this).children().first().attr("contenteditable",true);
						$(this).children().first().focus();
					});
					ele.children().first().focusout(function(){
        				$(this).parent().draggable("enable");
        				$(this).parent().click();
        				if (!$(this).hasClass("btn")){
        					$(this).attr("contenteditable",false);
        				}
					});
				}

				ele.click();
	}
}


function dragOutsideImage(event){
	noopHandler(event);
	var str = event.dataTransfer.getData("URL");
	if (str.match(/.jpg$/)||str.match(/.jpeg$/)||str.match(/.png$/)||str.match(/.svg$/)||str.match(/.gif$/)){
		$(this).children().first().attr("src", str);
	}
	else{
		// alert(str);
		alert("Only images of type jpg, jpeg, png, svg or gif are are allowed");
	}
}
