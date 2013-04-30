require 'spec_helper'

describe AnswersController do
	describe "POST create" do
    #create a page before each operation (method call)
    before(:each) do
    	page = Page.create(:html => "<div><button> Hi </button></div>" ,:page_name =>"test page")
    	question =Question.create(:body => "what do you think test ?",:assigned_part =>"1", :page_id =>1)
    end
    #Testing valid attributes as a params
    context "with valid attributes" do
      #Testing that the qustion is saved in the database
      it "creates a new answer for question" do
        expect{
        post :create, :answer => {:answer=> "test answer"}, :page_id => 1, :question_id =>1
        }.to change(Answer,:count).by(1)
      end
      #Testing that it is redirected back to the revieweing page(reviewer page) with the notice 
      it "redirects to the new reviewer page to see his answer" do
        post :create, :answer => {:answer=> "test answer"}, :page_id => 1,:question_id =>1
        response.should redirect_to ("/pages/reviewer?id=1&notice=Answer+was+successfully+created.")
      end
    end
    #Testing valid attributes as a params
    context "with invalid attributes" do
     #Testing that the qustion is not saved in the database
      it "does not save the new Answer" do
        expect{
          post :create, :answer => {:answer=> ""}, :page_id => 1,:question_id =>1
         }.to_not change(Answer,:count)
      end
       #Testing that it is redirected back to the revieweing page(reviewer page) with the notice 
      it "redirects to the new reviewer page to see his answer has not been added" do
        post :create, :answer => {:answer=> ""}, :page_id => 1,:question_id =>1
        response.should redirect_to ("/pages/reviewer?id=1&notice=Answer+could+not+be+saved.")
      end
    end 
  end
  describe 'DELETE destroy' do
    # Creating a answer and a page and question before each method call
    before :each do
      @page = Page.create(:html => "<div><button> Hi </button></div>" ,:page_name =>"test page")
      @question =Question.create(:body => "what do you think test ?",:assigned_part =>"1", :page_id =>1)
      @answer = Answer.create(:answer => "answer test", :question_id => 1, :page_id =>1)
    end
      #Testing that the answer is removed from the database
    it "deletes the answer" do
      expect{
      delete :destroy, id: @answer ,page_id: @page, question_id: @question       
      }.to change(Answer,:count).by(-1)
    end
  end
end
