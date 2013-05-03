//= require arbor
//= require graphics
//= require renderer 

var pages ={};
var drawdata = {nodes:{}, edges:{}};

// Load html files  and their name into a div
function addContent(data,name){
    $(data).siblings('.read').html($(data).text());
	checkLinks($(data).siblings('.read'),name);
	listlinks(data,name);
}

$(document).ready(function(){
    // load the html files to div to get the a tags
	$(".page_content").each(function(){
		$(this).click();
	});
    // Start arbor
    var sys = arbor.ParticleSystem(1000, 400,1);
    sys.parameters({gravity:true});
    sys.renderer = Renderer("#viewport") ;
    sys.graft(drawdata);
});

// Get all the links in the given page
// Draw the nodes
function checkLinks(data,name){
    var thelinks= [];
	$(data).find('a').each(function(){
		thelinks.push($(this).attr('href'));
	});
	pages[name]=thelinks;
    var json = '{"color":"orange","shape":"dot","label":"joe"}',
    obj = JSON.parse(json);
    obj.label=name;
    drawdata.nodes[name]=obj
}

//Draw the edges and connections
function listlinks(data,name){
	var g= '{"type":"arrow","directed":"<-"}', h = JSON.parse(g);
    var gg= '{}', hh = JSON.parse(gg);
    var connections="";
    $(data).siblings('.links').text(pages[name]);
    var x= hh;
    for (var i in pages[name]){
        connections= adjust_name(pages[name][i]);
        x[connections] = h;
   }
    drawdata.edges[name]=x;
    drawdata.nodes[name].color=get_random_color();
}

// Get random color each time called
function get_random_color() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.round(Math.random() * 15)];
    }
    return color;
}

// Remove the extra .html extension
function adjust_name(name){
    return name.replace('.html', '');
}
