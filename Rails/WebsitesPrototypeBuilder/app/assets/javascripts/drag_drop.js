			$(document).ready(function (){
				$("#imagediv").css({
					"width": "100px"
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
						      },
	  					        resize: function(event, ui){
							       ui.element.children(".toolboxelement").css({
							       	  "width": "100%" ,
							          "height": "100%"
							       });
							       $("#eid").text("ID: "+ui.element.attr("id"));
  								   $("#width").text("Width: "+ui.size.width);
  								   $("#height").text("Height: "+ui.size.height);
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
								cancel:false
							})
							.click(function() {
  								var eid = $(this).parent().attr("id");
  								$("#eid").text("ID: "+eid);
  								$("#width").text("Width: "+$(this).width());
  								$("#height").text("Height: "+$(this).height());
							});
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