describe("DragDrop", function() {
  it("contains spec with an expectation", function() {
  	loadFixtures("design.html.erb");
    expect($("#designpage")).toExist();
  });
});