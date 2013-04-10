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
		// 	if ($(this).attr("property")=="left"){
		// 		if ($("#left_inp").val().match([0-9]+)){
					
		// 		}
		// 	}
		// 	else if ($(this).attr("property")=="right"){
		// 		if ($("#left_inp").val().match([0-9]+)){
					
		// 		}
		// 	}
		// 	else if ($(this).attr("property")=="margin-left"){
		// 		if ($("#left_inp").val().match([0-9]+)){
					
		// 		}
		// 	}
		// 	else if ($(this).attr("property")=="margin-right"){

		// 	}
		// 	else if ($(this).attr("property")=="margin-top"){

		// 	}
		// 	else if ($(this).attr("property")=="margin-bottom"){

		// 	}
		// 	else if ($(this).attr("property")=="margin-right"){

		// 	}
		// 	else if ($(this).attr("property")=="margin-right"){

		// 	}
			$("#"+$("#eid_inp").val()).css($(this).attr("property"),$(this).val());
		// }
	});
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
			        	if (ui.element.outerWidth(true)>$("#designpage").width()){
			        		$(this).resizable('widget').trigger('mouseup');
			        		$(this).width($(this).width()-(ui.element.outerWidth(true)-$("#designpage").width()));
			        	}
			        	else if (ui.element.outerHeight(true)>$("#designpage").height()){
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
					/*$(".inp").css("visibility","visible");
					$(".p_prop").css("visibility","visible");*/
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