$(document).ready(function (){

	$("#imagediv").css({
		"width": "100px"
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
		if ($(this).attr("property")=="text"){
			$("#"+$("#eid_inp").val()).children().first().text($(this).val());
		}
		else{
			if (insideDesignPage($("#"+$("#eid_inp").val()),$(this).attr("property"),$(this).val())){
				$("#"+$("#eid_inp").val()).css($(this).attr("property"),$(this).val());
			}
		}
		$("#"+$("#eid_inp").val()).click();
	});

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
			} else {
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
		},

		stop: function(event, ui){

			var pos = $(ui.helper).offset();
			var pos1 = $("#designpage").offset();
			var name = "#element"+counter; //new element's name

			$(name).css({ //set position of the new element
			"left": pos.left-pos1.left,
			"top": pos.top-pos1.top
			});

			if ($(name).parent().attr("id")!="designpage") { //if the element is dropped outside the design page remove it from the document and don't add it to the design page
				counter--;
				$(name).remove();
			}
			else{
				$(name).removeClass("drag");
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
					if ($(this).attr("type")=="image"){

					}
					else if ($(this).attr("type")=="hyperlink"){

					}

				});

				$(name).click();		
			}
		}
	});

	$("#designpage").droppable({
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