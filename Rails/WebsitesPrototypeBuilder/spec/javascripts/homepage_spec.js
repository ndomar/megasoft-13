// author ahmed jihad

describe("Homepage", function() {
  it("testing if it slides down onclick", function() {
    $('.login_image').click();
    expect('.login_form').not.toBeVisible();
  });
  it("testing sliding div to go to who_are_we on click", function() {
  	$('.center').click();
    expect($('<div id="who_are_we">')).toExist();
  });
  it("testing sliding div to go to glimpse on click", function() {
  	$('.left').click();
    expect($('<div id="glimpse">')).toExist();
  });
  it("testing sliding div to go to slide on click", function() {
  	$('.right').click();
    expect($('<div id="slide">')).toExist();
  });
    it("testing sliding div to go to who_are_we on click", function() {
    $('.page2').click();
    expect($('<div id="who_are_we">')).toExist();
  });
  it("testing sliding div to go to glimpse on click", function() {
    $('.page3').click();
    expect($('<div id="glimpse">')).toExist();
  });
  it("testing sliding div to go to slide on click", function() {
    $('.page1').click();
    expect($('<div id="slide">')).toExist();
  });
});

