require 'spec_helper'

describe CommentsController do
  
  #Create method test
  describe "POST create" do
    #create a page before each operation (method call)
    before(:each) do
      page = FactoryGirl.create(:page)
    end
    #Testing valid attributes as a params
    context "with valid attributes" do
      #Testing that the qustion is saved in the database
      it "creates a new Comment" do
        expect{
        post :create, :comment => {:body=> "test comment",:assigned_part => "1"}, :page_id => 1
        }.to change(Comment,:count).by(1)
      end
      #Testing that it is redirected back to the revieweing page(reviewer page) with the notice 
      it "redirects to the new Comment" do
        post :create, :comment => {:body=> "test comment",:assigned_part => "1"}, :page_id => 1
        response.should redirect_to ("/pages/reviewer?id=#{assigns(:page).id}&notice=Comment+was+successfully+created.")
      end
    end
    #Testing valid attributes as a params
    context "with invalid attributes" do
      #Testing that the qustion is not saved in the database
      it "does not save the new Comment" do
        expect{
         post :create, :comment => {:body=> "",:assigned_part => "1"}, :page_id => 1
        }.to_not change(Comment,:count)
      end
      #Testing that it is redirected back to the revieweing page(reviewer page) with the notice 
      it "redirects to reviewing page (reviewer page)" do
        post :create, :comment => {:body=> "",:assigned_part => ""}, :page_id => 1
        response.should redirect_to ("/pages/reviewer?id=#{assigns(:page).id}&notice=Comment+could+not+be+saved.+Please+fill+in+all+fields")
      end
    end 
  end
  # Testing the deletion of a comment
  describe 'DELETE destroy' do
    # Creating a comment and a page before each method call
    before :each do
      @page = FactoryGirl.create(:page)
      @comment = FactoryGirl.create(:comment)
    end
      #Testing that the qustion is removed from the database
    it "deletes the comment" do
      expect{
      delete :destroy, id: @comment ,page_id: @page       
      }.to change(Comment,:count).by(-1)
    end
      #Testing that it is redirected back to the revieweing page(reviewer page) with the notice 
    it "redirects to reviewing page" do
      delete :destroy, id: @comment,page_id: @page
      response.should redirect_to ("/pages/reviewer?id=#{assigns(:page).id}&notice=Comment+was+successfully+deleted.")
    end
  end
end