require 'spec_helper'

describe QuestionnairesController do

  describe "GET index" do

    it "renders the index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested task to @task" do
      questionnaire = FactoryGirl.create(:questionnaire)
      get :show, id: questionnaire
      assigns(:questionnaire).should eq(questionnaire)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:questionnaire)
      response.should render_template("show")
    end
  end
end