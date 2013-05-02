//these functions are used in the package explorer

function show(id,commit){
	var designPage = document.getElementById('designpage');
	designPage.setAttribute("data-pageid", id);
	var params = $.param({
		pageId: id,
		"commit": commit
	});
	$.ajax("/projects/showPage?" + params);
	$("html, body").animate({ scrollTop: 0 }, 600);
}

function saveProjectProgress(){
	store();
}

function store(){
	//i need something to notify me not to show this alert
	var response=confirm("هل أنت متأكد أنك تريد حفظ؟");
	if(response==true){
		var html = document.getElementById('designpage').innerHTML; 	//this gets the html from the designpage pane and stores it in the variable html
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

function deletePage(){
	var response=confirm("هل أنت متأكد أنك تريد حذف هذه الصفحة؟");
	if(response){
		var pageId = $("#alt-text").text();	
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

function addPage(project_id,event){
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
	// event.stopDefault();
}

$(document).ready(function() {
	$('#myCarousel').slideUp('slow', function() {
		document.getElementById('title-text').setAttribute("style","display:none");
	});
	$('#navbar').mouseenter(function(){
		$('#myCarousel').slideDown('slow', function() {
			document.getElementById('title-text').setAttribute("style","visibility:visible");
			$('#title-text').attr( 'style',"display: block");
		});
	});
	$('#designpage').mouseenter(function() {
		$('#myCarousel').slideUp('slow', function() {
			document.getElementById('title-text').setAttribute("style","visibility:hidden");
			$('#title-text').attr( 'style',"display: none");
		});
	});	
	$('#sidebar').mouseenter(function() {
		$('#myCarousel').slideUp('slow', function() {
			document.getElementById('title-text').setAttribute("style","visibility:hidden");
			$('#title-text').attr('style',"display: none");
		});
	});
});
