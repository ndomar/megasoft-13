var page = require('webpage').create();
var system = require('system');
address = system.args[1];
title = system.args[2];

page.open(address, function () {
		//page.clipRect{width: 850, height: 750, border:0}
    window.setTimeout(function () {
    	page.render('app/assets/images/page_' + title + '.jpg');
    	phantom.exit();
    }, 5000);
});