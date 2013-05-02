var pages ={};

function addContent(data,name){
	$(data).siblings('.read').html($(data).text());
	checkLinks($(data).siblings('.read'),name);
	listlinks(data,name);
}

$(document).ready(function(){
	$(".page_content").each(function(){
		$(this).click();
	});
});

function checkLinks(data,name){
	var thelinks= [];
	$(data).find('a').each(function(){
		thelinks.push($(this).attr('href'));
	});
	pages[name]=thelinks;
}


function listlinks(data,name){
	$(data).siblings('.links').text(pages[name]);
}