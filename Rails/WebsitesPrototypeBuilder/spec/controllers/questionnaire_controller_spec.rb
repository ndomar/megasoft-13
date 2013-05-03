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

  describe "GET #new" do
    it "assigns a home, office, and mobile phone to the new contact" do
      get :new
      response.should render_template("new")
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new Questionnaire" do
        expect{
        post :create, :questionnaire => {:title=> "test questionnaire",:qquestions_attributes => [{:body =>"My Question?",:qtype => 1}]}
        }.to change(Questionnaire,:count).by(1)
      end
      
      it "redirects to the new Questionnaire" do
        post :create, :questionnaire => {:title=> "test questionnaire",:qquestions_attributes => [{:body =>"My Question?",:qtype => 1}]}
        response.should redirect_to Questionnaire.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new Questionnaire" do
        expect{
         post :create, :questionnaire => {:title=> "",:qquestions_attributes => [{:body =>"My Question?",:qtype => 1}]}
        }.to_not change(Questionnaire,:count)
      end
    
      it "re-renders the new method" do
        post :create, :questionnaire => {:title=> "",:qquestions_attributes => [{:body =>"My Question?",:qtype => 1}]}
        response.should render_template :new
      end
    end 
  end

  describe 'DELETE destroy' do
    before :each do
      @questionnaire = FactoryGirl.create(:questionnaire)
    end
    
    it "deletes the contact" do
      expect{
        delete :destroy, id: @questionnaire        
      }.to change(Questionnaire,:count).by(-1)
    end
      
    it "redirects to contacts#index" do
      delete :destroy, id: @questionnaire
      response.should redirect_to questionnaires_url
    end
  end
end