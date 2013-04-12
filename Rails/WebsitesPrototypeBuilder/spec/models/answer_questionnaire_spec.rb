require 'spec_helper.rb'

describe AnswerQuestionnaire do

  before(:each) do
    Questionnaire.create(:title=> "test questionnaire")
    Qquestion.create(:body => "question test",:number => 1,:qtype => 1, :questionnaire_id=>1)
    @attr = {:body => "answer test", :qquestion_id => 1, :questionnaire_id =>1}
  end
    it "should create a new answer" do
    AnswerQuestionnaire.create!(@attr)
  end

   it "should require an answer" do
    no_answer = AnswerQuestionnaire.new(@attr.merge(:body => ""))
    no_answer.should_not be_valid
  end
end