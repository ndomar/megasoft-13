require 'spec_helper.rb'

describe Page do

  before(:each) do
    @attr = {:page_name=> "test page"}
  end

  it "should create a new page" do
    Page.create!(@attr)
  end

   it "should require a page_name" do
    no_page_name = Page.new(@attr.merge(:page_name => ""))
    no_page_name.should_not be_valid
  end

	let(:page) { FactoryGirl.build(:page) }    

	it "Has a unique page_name if same project" do
	  older_page = FactoryGirl.create(:page)
	  page.page_name = older_page.page_name
	  page.project_id = older_page.project_id
	  page.should_not be_valid
	end

	it "Should have same page_name for different projects" do
	  older_page = Page.new(@attr.merge(:page_name => "page_name"))
	  page.page_name = 1
	  older_page.project_id = 2
	  page.page_name = older_page.page_name
	  page.should be_valid
	end

	it "should have many comments, comments should be destroyed when page is destroyed" do
		page = FactoryGirl.create(:page)
		page.comments << Comment.create(:body => "my comment")
		page.comments << Comment.create(:body => "my comment2")
		page.comments.length.should == 2
		page.destroy
		Comment.all.should_not include("my comment")
		Comment.all.should_not include("my comment2")
	end

	it "should have many questions, questions should be destroyed when page is destroyed" do
		page = FactoryGirl.create(:page)
		page.questions << Question.create(:body => "my question")
		page.questions << Question.create(:body => "my question2")
		page.questions.length.should == 2
		page.destroy
		Question.all.should_not include("my question")
		Question.all.should_not include("my question2")
	end

	it "should have many steps" do
		page = FactoryGirl.create(:page)
		page.steps << Step.create(:component => "testComponent", :description => "testDescription", :event => "onclick", :task_id => 1, :page_id => 1)
		page.steps << Step.create(:component => "testComponent2", :description => "testDescription", :event => "onclick", :task_id => 1, :page_id => 1)
		page.steps.length.should == 2
	end

end