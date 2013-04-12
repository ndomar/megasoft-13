require 'spec_helper'

describe QuestionnairesController do

  before(:each) do
   Questionnaire.create(:title=> "test questionnaire")
   Qquestion.create(:body => "question test",:number => 1,:qtype => 1, :questionnaire_id=>1)
  end

  it "should create a new answer" do

    post :create,{ :questionnaire_id => 1 , :qquestion_id => 1, :body => "test answer"}

   	response.should redirect_to(:controller => :questionnaires, :action => :answer_show, :id => @questionnaire,:notice => 'Answer was successfully created.')
  end
end
