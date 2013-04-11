require 'spec_helper.rb'

describe Answer_questionnaire do

  before(:each) do
    Questionnaire.create(:title=> "test questionnaire")
    Qquestion.create(:body => "question test",:number => 1,:qtype => 1, :questionnaire_id=>1)
    @attr = {:answer => "answer test", :qquestion_id => 1, :questionnaire_id =>1}
  end
    it "should create a new answer" do
    Answer_questionnaire.create!(@attr)
  end

   it "should require an answer" do
    no_answer = Answer_questionnaire.new(@attr.merge(:answer => ""))
    no_answer.should_not be_valid
  end
end