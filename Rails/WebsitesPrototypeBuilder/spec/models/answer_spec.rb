require 'spec_helper'

describe Answer do

  before(:each) do
    Page.create(:html => "<div><button> Hi </button></div>" ,:page_name =>"test page")
    Question.create(:body => "what do you think test ?",:assigned_part =>"1", :page_id =>1)
    @attr = {:answer => "answer test", :question_id => 1, :page_id =>1}
  end
    it "should create a new answer" do
    Answer.create!(@attr)
  end

   it "should require an answer" do
    no_answer = Answer.new(@attr.merge(:answer => ""))
    no_answer.should_not be_valid
  end
end
