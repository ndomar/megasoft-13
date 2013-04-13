require 'spec_helper'

describe AnswerQuestionnairesController do

  before(:each) do
    Questionnaire.create(:title=>'Questionnaire Title',:project_id=> 1,:qquestions_attributes=> [{:body =>"My Question?",:qtype => 1}])
  end

  #Testing valid attributes as a params
  context "with valid attributes" do
    #Testing that the qustion is saved in the database
    it "creates a new answer for question" do
      expect{
      post :create, :answer_questionnaire => {:body=> "test answer"}, :questionnaire_id => 1, :qquestion_id =>1
      }.to change(AnswerQuestionnaire,:count).by(1)
    end
  end
end
