require 'spec_helper'

describe QuestionsController do
  
  #Create method test
  describe "POST create" do
    #create a page before each operation (method call)
    before(:each) do
      page = FactoryGirl.create(:page)
    end
    #Testing valid attributes as a params
    context "with valid attributes" do
      #Testing that the qustion is saved in the database
      it "creates a new Question" do
        expect{
        post :create, :question => {:body=> "test question",:assigned_part => "1"}, :page_id => 1
        }.to change(Question,:count).by(1)
      end
      #Testing that it is redirected back to the revieweing page(designer page) with the notice 
      it "redirects to the new Question" do
        post :create, :question => {:body=> "test question",:assigned_part => "1"}, :page_id => 1
        response.should redirect_to ("/pages/designer?id=#{assigns(:page).id}&notice=Question+was+successfully+created.")
      end
    end
    #Testing valid attributes as a params
    context "with invalid attributes" do
      #Testing that the qustion is not saved in the database
      it "does not save the new Question" do
        expect{
         post :create, :question => {:body=> "",:assigned_part => "1"}, :page_id => 1
        }.to_not change(Question,:count)
      end
      #Testing that it is redirected back to the revieweing page(designer page) with the notice 
      it "redirects to reviewing page (designer page)" do
        post :create, :question => {:body=> "",:assigned_part => ""}, :page_id => 1
        response.should redirect_to ("/pages/designer?id=#{assigns(:page).id}&notice=Question+could+not+be+saved.+Please+fill+in+all+fields")
      end
    end 
  end
  # Testing the deletion of a question
  describe 'DELETE destroy' do
    # Creating a question and a page before each method call
    before :each do
      @page = FactoryGirl.create(:page)
      @question = FactoryGirl.create(:question)
    end
      #Testing that the qustion is removed from the database
    it "deletes the question" do
      expect{
      delete :destroy, id: @question ,page_id: @page       
      }.to change(Question,:count).by(-1)
    end
      #Testing that it is redirected back to the revieweing page(designer page) with the notice 
    it "redirects to reviewing page" do
      delete :destroy, id: @question,page_id: @page
      response.should redirect_to ("/pages/designer?id=#{assigns(:page).id}&notice=Question+was+successfully+deleted.")
    end
  end
=======
require 'spec_helper'

describe QuestionsController do
  
  #Create method test
  describe "POST create" do
    #create a page before each operation (method call)
    before(:each) do
      page = FactoryGirl.create(:page)
    end
    #Testing valid attributes as a params
    context "with valid attributes" do
      #Testing that the qustion is saved in the database
      it "creates a new Question" do
        expect{
        post :create, :question => {:body=> "test question",:assigned_part => "1"}, :page_id => 1
        }.to change(Question,:count).by(1)
      end
      #Testing that it is redirected back to the revieweing page(designer page) with the notice 
      it "redirects to the new Question" do
        post :create, :question => {:body=> "test question",:assigned_part => "1"}, :page_id => 1
        response.should redirect_to ("/pages/designer?id=#{assigns(:page).id}&notice=Question+was+successfully+created.")
      end
    end
    #Testing valid attributes as a params
    context "with invalid attributes" do
      #Testing that the qustion is not saved in the database
      it "does not save the new Question" do
        expect{
         post :create, :question => {:body=> "",:assigned_part => "1"}, :page_id => 1
        }.to_not change(Question,:count)
      end
      #Testing that it is redirected back to the revieweing page(designer page) with the notice 
      it "redirects to reviewing page (designer page)" do
        post :create, :question => {:body=> "",:assigned_part => ""}, :page_id => 1
        response.should redirect_to ("/pages/designer?id=#{assigns(:page).id}&notice=Question+could+not+be+saved.+Please+fill+in+all+fields")
      end
    end 
  end
  # Testing the deletion of a question
  describe 'DELETE destroy' do
    # Creating a question and a page before each method call
    before :each do
      @page = FactoryGirl.create(:page)
      @question = FactoryGirl.create(:question)
    end
      #Testing that the qustion is removed from the database
    it "deletes the question" do
      expect{
      delete :destroy, id: @question ,page_id: @page       
      }.to change(Question,:count).by(-1)
    end
      #Testing that it is redirected back to the revieweing page(designer page) with the notice 
    it "redirects to reviewing page" do
      delete :destroy, id: @question,page_id: @page
      response.should redirect_to ("/pages/designer?id=#{assigns(:page).id}&notice=Question+was+successfully+deleted.")
    end
  end
 
end