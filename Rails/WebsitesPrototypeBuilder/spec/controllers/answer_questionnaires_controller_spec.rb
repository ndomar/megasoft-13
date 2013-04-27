require 'spec_helper'

describe AnswerQuestionnairesController do

  before(:each) do
    Questionnaire.create(:title=> "test questionnaire",:qquestions_attributes => [{:body =>"My Question?",:qtype => 1}])
  end

  #Testing valid attributes as a params
  context "with valid attributes" do
    #Testing that the qustion is saved in the database
    it "creates a new answer for question" do
      expect{
      post :create, :answer_questionnaire => {:body=> "test answer"},:qquestion_id =>1, :questionnaire_id=>1
      }.to change(AnswerQuestionnaire,:count).by(1)
    end
    # Testing that it is redirected back to the when he clicks answer 
    it "refreshes the page to see his answer" do
      post :create, :answer_questionnaire => {:body=> "test answer"},:qquestion_id =>1, :questionnaire_id=>1
      response.should redirect_to ("/questionnaires/answer_show?id=1&notice=Answer+was+successfully+created.")
    end
  end
  #Testing valid attributes as a params
  context "with invalid attributes" do
    #Testing that the answer is not saved in the database
    it "does not save the new Answer" do
      expect{
        post :create,:answer_questionnaire => {:body=> ""},:qquestion_id =>1, :questionnaire_id=>1
        }.to_not change(AnswerQuestionnaire,:count)
    end
      #Testing that it is refreshed with the notice 
    it "redirects to the new reviewer page to see his answer has not been added" do
      post :create, :answer_questionnaire => {:body=> ""},:qquestion_id =>1, :questionnaire_id=>1
      response.should redirect_to ("/questionnaires/answer_show?id=1&notice=Answer+was+not+successfully+created.")
    end
  end 
end
