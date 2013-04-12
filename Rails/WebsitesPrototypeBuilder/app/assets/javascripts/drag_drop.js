$(document).ready(function (){
	$("#imagediv").css({
		"width": "100px"
	});
	$("#save_event").click(function(){
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
		alert("Event saved successfully");
	});
	$(".inp").blur(function(){
		if ($(this).attr("property")=="text"){
			$("#"+$("#eid_inp").val()).children().first().text($(this).val());
		}
		// else{
			// if ($(this).attr("property")=="left"){
			// 	var value = parseInt($("#left_inp").val());
			// 	if (value<0 || exceedsWidth(value)){
			// 		return;
			// 	}
			// }
			// else if ($(this).attr("property")=="top"){
			// 	var value = parseInt($("#top_inp").val());
			// 	if (value<0 || exceedsHeight(value)){
			// 		return;
			// 	}
			// }
			// else if ($(this).attr("property")=="margin-left"){
			// 	var value = parseInt($("#margin_left_inp").val());
			// 	if (exceedsWidth(value)||!insideDesignPageHorizontally(value)){
			// 		return;
			// 	}
			// }
			// else if ($(this).attr("property")=="margin-right"){
			// }
			// else if ($(this).attr("property")=="margin-top"){

			// }
			// else if ($(this).attr("property")=="margin-bottom"){

			// }
			// else if ($(this).attr("property")=="margin-right"){

			// }
			// else if ($(this).attr("property")=="margin-right"){

			// }
			else{
				// alert(insideDesignPage($(this),$(this).attr("property"),$(this).val()));
				if (insideDesignPage($("#"+$("#eid_inp").val()),$(this).attr("property"),$(this).val())){
					$("#"+$("#eid_inp").val()).css($(this).attr("property"),$(this).val());
				}
			}
			$("#"+$("#eid_inp").val()).click();

		// }
	});

	function exceedsWidth(element,val,left_pos){
		// alert(left_pos);
		return element.outerWidth(true)+val>$("#designpage").width();
	}

	function exceedsHeight(element,val,top_pos){
		// alert(top_pos);
		return element.outerHeight(true)+val>$("#designpage").height();
	}

	function insideDesignPage(element,property,val){
		try{
			var pp = element.css(property);
			element.css(property,val);
			// var pos = element.position($("#designpage"));
			var pos = element.offset();
			pos.left-=$("#designpage").offset().left;
			pos.top-=$("#designpage").offset().top;
			// alert(pos.left+" "+pos.top+" "+property+" "+val);
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

	function maxWidth(element){
	}

	function maxHeight(element){
	}

	function maxMarginLeft(element){

	}

	function maxMarginRight(element){

	}

	function maxMarginTop(element){

	}

	function maxMarginBottom(element){

	}

	counter = 0; //Counts number of elements in the Design Page
	$(".drag").draggable({
		helper: 'clone',// clone the dragged element and drag the newly created one
		containment: 'designpage',// elements should be contained in design page not any other element
		cancel:false,// drag action not overriten by any other actions (ex. button's onClick event)
		start: function (event,ui){
			counter++; //When dragging starts, increment the counter
		},
		stop: function(event, ui){
			var pos = $(ui.helper).offset();
			var pos1 = $("#designpage").offset();
			var name = "#element"+counter; //new element's name
			$(name).css({ //set posn of the new element
			"left": pos.left-pos1.left,
			"top": pos.top-pos1.top
			});
			if ($(name).parent().attr("id")!="designpage") {
				counter--;
				$(name).remove();
			}
			else{
				$(name).removeClass("drag");
				$(name).resizable({
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
			        	if (exceedsWidth(ui.element,0,ui.position.left)){
			        		$(this).resizable('widget').trigger('mouseup');
			        		$(this).width($(this).width()-(ui.element.outerWidth(true)-$("#designpage").width()));
			        	}
			        	else if (exceedsHeight(ui.element,0,ui.position.top)){
			        		$(this).resizable('widget').trigger('mouseup');
			        		$(this).height($(this).height()-(ui.element.outerHeight(true)-$("#designpage").height()));
			        	}
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
					drag: function(event, ui){
						$("#left_inp").val(ui.position.left+"px");
					   	$("#top_inp").val(ui.position.top+"px");
					}
				})
				.click(function() {	
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
				});
				$(name).click();
			}
		}
	});

	$("#designpage").droppable({
		drop: function(event, ui){
			// alert(ui.draggable.attr('id'));
			if (ui.draggable.attr('id').search(/element([0-9])/)==-1){ // if it is not an already dragged element
				var element = $(ui.draggable).clone(); // clone the dragged element
				element.attr("id","element"+counter); // change its id
				element.addClass("appended"); // give it class appended
				$(this).append(element); // add the element to the design page (writing html code to the div)
			}
		}
	});
});