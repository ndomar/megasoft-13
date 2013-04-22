//these functions are used in the package explorer

function show(id,html){
	if(designpage.getAttribute("data-pageid")!=0 && designpage.getAttribute("data-pageid")!=id)  {
		store();
	}
	var designPage = document.getElementById('designpage');
	designPage.innerHTML="";
	designPage.innerHTML=html;
	designPage.setAttribute("data-pageid", id);
}

function saveProjectProgress(){
	store();
	//save tasks
	//save cardsorting
}

function store(){
	//alert("asd");
	//var html = "<p>sdadwa</p>"; used for testing
	var response=confirm("هل أنت متأكد أنك تريد حفظ؟");
	if(response==true){
			var html = document.getElementById('designpage').innerHTML;						//this gets the html from the designpage pane and stores it in the variable html
			var pageId = document.getElementById('designpage').getAttribute("data-pageid");	//this gets the id of the page being designed right now but obtaining it from the attribute data-pageid
			var params = $.param({
				pageid: pageId,
				"html": html
			});
			$.ajax("/projects/save?" + params);
			//this is the ajax request to update and save the updated page
		}
}

function deletePage(pageId){
	//this function is used to delete a page by the designer
	var response=confirm("هل أنت متأكد أنك تريد حذف هذه الصفحة؟");
	if(response){
			var params = $.param({
				pageid: pageId
			});
			alert(params);
			$.ajax("/projects/deletePage?" + params);
	  }
	alert("Done");
}

function addPage(project_id){
	//this function is used to create new page by the designer
	var pagename=prompt("الرجاء إدخال اسم الصفحة","");
	if (pagename!=null && pagename!=""){
  	var params = $.param({
			pageName: pagename,
			projectId: project_id
		});
		$.ajax("/projects/createPage?" + params);
  } 
}

function display(){
	//this function is used to slide the carousel up and down
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