describe("reviewing", function() {
  it("testing if the little green buttons appear onclick", function() {
    $('.lilbuttonc').click();
    expect('.nom').not.toBeVisible();
  });
  it("testing switching between comments and questions", function() {
    $('.sw').click();
    expect($('<div id="questions">')).toExist();
  });
  it("testing if answers2 div show on click", function() {
    $('.coms').click();
    expect($('<div id="answers2">')).toExist();
  });
});