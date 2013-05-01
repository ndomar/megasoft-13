//these functions are used in the package explorer

function show(id){
	var params = $.param({
		pageId: id
	});
	$.ajax("/projects/showPage?" + params);
}

function saveProjectProgress(){
	store();
}

function store(){
	//i need something to notify me not to show this alert
	var response=confirm("هل أنت متأكد أنك تريد حفظ؟");
	if(response==true){
		var html = document.getElementById('designpage').innerHTML; 	//this gets the html from the designpage pane and stores it in the variable html
		// alert(document.getElementById('designpage').innerHTML.toString());
		html = html.replace(/\s+/g, ' ');
		var pageId = document.getElementById('designpage').getAttribute("data-pageid");	//this gets the id of the page being designed right now but obtaining it from the attribute data-pageid
		//reseting the ondbclick show event
		var htmlToDisplay=html;
		document.getElementById(pageId).ondblclick= function () {
																			          	var designPage = document.getElementById('designpage');
																			          	if(designPage.getAttribute("data-pageid")!=0 && designPage.getAttribute("data-pageid")!=pageId){	//&& hasDesigned
																										store();
																									}
																									designPage.innerHTML="";
																									//call malatawy's new function
																									designPage.innerHTML=htmlToDisplay;
																									designPage.setAttribute("data-pageid", pageId);
																								};
		// html=html.replace( 	"&", "&amp;" , 'g');
		// html=html.replace( "<" , "&lt;"  , 'g');
		// html=html.replace( 	">", "&gt;"  , 'g');
		// html=html.replace(  '"' , '\"', 'g');
		// html=html.replace( 	"'", "\'" , 'g');
		// html=html.replace( "/" , '&#x2F;', 'g');
		//	 "&": "&amp;",
	  //   "<": "&lt;",
	  //   ">": "&gt;",
	  //   '"': '&quot;',
	  //   "'": '&#39;',
	  //   "/": '&#x2F;'
		html=html.replace( "onclickevent", "onclick" , 'g');
		html=html.replace( "onhoverevent", "onmouseover" , 'g');

		var params = $.param({
			pageid: pageId,
			"html": html
		});
		$.ajax({
			url: "/projects/savePage",
			method: 'post',
			data: params
		});
		//this is the ajax request to update and, save the updated page
	}
}

function deletePage(pageId){
	//this function is used to delete a page by the designer
	var response=confirm("هل أنت متأكد أنك تريد حذف هذه الصفحة؟");
	if(response){
		var pageid = document.getElementById('designpage').getAttribute("data-pageid");	
		if(pageid==pageId){
			var designPage = document.getElementById('designpage');
			designpage.innerHTML="<p>صمم صفحتك هنا</p>";
			designPage.setAttribute("data-pageid", 0);
		}
		var params = $.param({
			pageid: pageId
		});
		$.ajax("/projects/deletePage?" + params);
	}
}

function addPage(project_id){
	//this function is used to create new page by the designer
	var pagename=prompt("الرجاء إدخال اسم الصفحة","");
	if(pagename!=null ){
		if (pagename!=""){
	  	var params = $.param({
				pageName: pagename,
				projectId: project_id
			});
			$.ajax("/projects/createPage?" + params);
	  }else{
	  	alert("الرجاء التأكد من أن اسم الصفحة فريد من نوعه وغير فارغ");
	  } 
	}
}

function display(){
	// this function is used to slide the carousel up and down
	var displayValue =  document.getElementById('myCarousel').getAttribute("data-display");
	if(displayValue==0){	
		//if data-display ==0 then the carousel is visible
		$('#myCarousel').slideUp('slow', function() {
			document.getElementById('myCarousel').setAttribute("data-display","1");
			document.getElementById('carouselImage').setAttribute("src","/assets/upArrow.jpg");
		});
	}
	else
	{	//if data-display ==1 then the carousel is hidden
		$('#myCarousel').slideDown('slow', function() {
			document.getElementById('myCarousel').setAttribute("data-display","0");
			document.getElementById('carouselImage').setAttribute("src","/assets/downArrow.jpg");
		});
	}
}

$(document).ready(function() {
	//this is to make the user see that it is available and hide it at the begining of the designing
	$('#myCarousel').slideUp('slow', function() {
			document.getElementById('myCarousel').setAttribute("data-display","1");
			//to hide it as soon as the page loads
		});
	$('#myCarousel').carousel({interval: false});
	//to prevent the carousel from automatically sliding
});

function replace(){
	html=prompt("اHTML","");
	html = html.replace(/"/g, '\\\\"');
	html = html.replace(/'/g, "\\\\'");
	alert(html);
}

function getMe(){
	// alert(document.getElementById('designpage').innerHTML);
	// var html ="asdasd";
	// var designPage = document.getElementById('designpage');
	// designPage.innerHTML=html;
}

function loadToDesign(originalPageHTML,originalPageId){
	if(originalPageHTML!=null && originalPageHTML!=""){
		originalPageHTML=originalPageHTML.replace( "onclick", "onclickevent" , 'g');
		originalPageHTML=originalPageHTML.replace( "onmouseover", "onhoverevent" , 'g');
		var designPage = document.getElementById('designpage');
		designPage.innerHTML="";
		designPage.innerHTML=originalPageHTML;
		designPage.setAttribute("data-pageid", originalPageId);
	}
}

//________________________________________________
// $(".drag").draggable({
// 	helper: 'clone',// clone the dragged element and drag the newly created one
// 	containment: 'trash',// elements should be contained in design page not any other element
// 	cancel:false,// drag action not overriten by any other actions (ex. button's onClick event)

// 	drag: function (event,ui){
// 		if (ui.helper.parent().attr("id")=="designpage"){
// 			ui.helper.css("color","black");
// 		}
// 		else{
// 			ui.helper.css("color","white");
// 		}
// 	},
// 	stop: function(event, ui){
// 		var pos = $(ui.helper).offset();
// 		var pos1 = $("#designpage").offset();
// 		var name = "#element"+counter; //new element's name

// 		if ($(name).parent().attr("id")!="designpage") { //if the element is dropped outside the design page remove it from the document and don't add it to the design page
// 			$(name).remove();
// 		}
// 		else{
// 			$(name).removeClass("drag");
// 			$(name).append('<i id = "close" class="icon-remove" style="top: 0px; right: 0px; position: absolute;"></i>');
// 			$(name).children("#close").click(function(){
// 				$(name).remove();
// 			});
// 			$(name).resizable({ //define resizable action for the new element
// 				containment: 'parent',
// 				alsoResize: $(name).children(".toolboxelement"),
// 			    cancel: false,
// 		        start: function(event, ui){
// 	  	    		ui.element.children(".toolboxelement").css({
// 	      				"width": "100%" ,
// 	       				"height": "100%"
//    		        	});
// 	            	ui.element.click();
// 		      	},
// 			    resize: function(event, ui){
// 		        	ui.element.children(".toolboxelement").css({
// 	       	  		"width": "100%" ,
// 	          		"height": "100%"
// 		       		});
// 		       		//if the resize exceeds the design page's width and height, stop the resize action (trying to fix the jquery-ui bug)
// 		        	if (exceedsWidth(ui.element,0,ui.position.left)){
// 		        		$(this).resizable('widget').trigger('mouseup');
// 		        		$(this).width($(this).width()-(ui.element.outerWidth(true)-$("#designpage").width()));
// 		        	}
// 		        	else if (exceedsHeight(ui.element,0,ui.position.top)){
// 		        		$(this).resizable('widget').trigger('mouseup');
// 		        		$(this).height($(this).height()-(ui.element.outerHeight(true)-$("#designpage").height()));
// 		        	}
// 		        	//update the properties "width" and "height" as the element is being resized
// 				    $("#width_inp").val(ui.size.width);
// 				    $("#height_inp").val(ui.size.height);
// 			    },
// 		        stop: function(event, ui){
// 				      ui.element.children(".toolboxelement").css({
// 		         	  "width": "100%" ,
// 		     	      "height": "100%"
// 			        });
// 		        }
// 			})
// 			.draggable({ //new draggable to avoid cloning elements that are moved within the design page
// 				containment: 'parent',
// 				cancel:false,

// 				start: function(event, ui){
// 					ui.helper.click();
// 				},

// 				drag: function(event, ui){ //update the properties "left" and "right" as the element is being moved
// 					$("#left_inp").val(ui.position.left+"px");
// 			   	$("#top_inp").val(ui.position.top+"px");
// 				}

// 			})
// 			.click(function() {	//click function to show the properties of the element in the properties panel

// 				$(".properties").css("visibility","visible");
// 				var eid = $(this).attr("id");
// 				$("#eid_inp").val(eid);
// 				$("#text_inp").val($(this).children().first().text());
// 				$("#width_inp").val($(this).width());
// 				$("#height_inp").val($(this).height());
// 				$("#margin_left_inp").val($(this).css("margin-left"));
// 				$("#margin_right_inp").val($(this).css("margin-right"));
// 				$("#margin_top_inp").val($(this).css("margin-top"));
// 				$("#margin_bottom_inp").val($(this).css("margin-bottom"));
// 				$("#top_inp").val($(this).position().top+"px");
// 				$("#left_inp").val($(this).position().left+"px");
// 				$("#font_color_inp").css("background-color",$(this).children().first().css("color"));
// 			})
// 			.hover(function(){
// 				var close = $(this).children("#close");
// 				close.css("visibility","visible");
// 			}, function(){
// 				var close = $(this).children("#close");
// 				close.css("visibility","hidden");
// 			})
// 			.dblclick(function() {
// 				$(this).children().first().attr("contenteditable","true");
// 			});

// 			$(name).click();		
// 		}
// 	}
// });

// $("#designpage").droppable({
// 	tolerance: 'fit',
// 	drop: function(event, ui){
// 		if(ui.draggable.attr('id').search(/element([0-9])/)==-1){ // if it is not an already dragged element
// 			var element = $(ui.draggable).clone(); // clone the dragged element
// 			element.attr("id","element"+counter); // change its id
// 			element.addClass("appended"); // give it class appended
// 			$(this).append(element); // add the element to the design page (writing html code to the div)
// 		}
// 	}
// });

