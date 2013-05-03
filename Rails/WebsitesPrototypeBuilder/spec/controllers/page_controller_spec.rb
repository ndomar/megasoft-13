require 'spec_helper'

describe PagesController do
  before :each do
    @project = FactoryGirl.create(:project)
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "renders the :show template" do
      page = post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => @project}
      get :show, id: 1
      response.should render_template("show")
    end
  end

  describe "GET #new" do
    it "redirect to new page" do
      get :new
      response.should render_template("new")
    end
  end

  describe "POST create" do

    context "with valid attributes" do
      it "creates a new Page" do
        expect{
        post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => @project}
        }.to change(Page,:count).by(1)
      end
      
      it "redirects to the new Page" do
        post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => @project}
        response.should redirect_to Page.last
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new Page" do
        expect{
         post :create, :page => {:page_name=> "",:html => "<html></html>",:project_id => @project}
        }.to_not change(Page,:count)
      end
    
      it "re-renders the new method" do
        post :create, :page => {:page_name=> "",:html => "<html></html>",:project_id => @project}
        response.should render_template :new
      end
    end 
  end

  describe 'DELETE destroy' do
    before :each do
      post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => 1}
    end
    
    it "deletes the page" do
      expect{
        delete :destroy, id: 1   
      }.to change(Page,:count).by(-1)
    end
      
    it "redirects to pages#index" do
      delete :destroy, id: 1
      response.should redirect_to pages_url
    end
  end

  describe 'reviewer page' do
    it "redirects to reviewer page" do
      post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => 1}
      get :reviewer, id: 1
      response.should render_template("reviewer")
    end
  end

  describe 'designer page' do
    it "redirects to designer page" do
      post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => 1}
      get :designer, id: 1
      response.should render_template("designer")
    end
  end

  describe 'download' do
    it "downloads the selected page" do
      post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => 1}
      get :download, id: 1
      controller.stub!(:render)
    end
  end


  describe 'flowchart' do
    it "get all pages related to this project" do
      post :create, :page => {:page_name=> "test_page",:html => "<html></html>",:project_id => 1}
      get :allpages, id: 1
      response.should render_template("flowchart")
    end
  end

end