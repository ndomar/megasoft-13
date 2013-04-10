require "spec_helper"

describe TasksController do 

  describe "GET index" do
    it "renders index view" do
      project = FactoryGirl.create(:project)
      get :index, :project_id => project
      response.should render_template('index')
    end
  end

  describe "Click button create new task" do
    it "redirects to new view" do
      project = FactoryGirl.create(:project)
      get :new, :project_id => project
      response.should render_template('new')
    end
  end

  describe "Create new Task" do
    it "creates instance task that belongs to project id and has name field" do 
      project = FactoryGirl.create(:project)
      get :create, :project_id => project, :task => FactoryGirl.attributes_for(:task)
      response.should redirect_to project_tasks_path
    end

    it "renders new view if name field is missing" do
      project = FactoryGirl.create(:project)
      get :create, :project_id => project, :task => {:name => ""}
      response.should render_template 'new'
    end
  end

  describe "Click button edit task" do
    it "redirects to edit view" do
      project = FactoryGirl.create(:project)
      task = project.tasks.create(FactoryGirl.attributes_for(:task))
      get :edit, :project_id => project, :id => task
      response.should render_template('edit')
    end
  end  

  describe "Update a certain task" do
    it "redirects to index after updating the parameters" do
      project = FactoryGirl.create(:project)
      task = project.tasks.create(FactoryGirl.attributes_for(:task))
      get :update, :project_id => project, :id => task, :task => {:name => "Edited Test"}
      response.should redirect_to project_tasks_path
    end

    it "renders edit view if name field is missing" do
      project = FactoryGirl.create(:project)
      task = project.tasks.create(FactoryGirl.attributes_for(:task))
      get :update, :project_id => project, :id => task, :task => {:name => ""}
      response.should render_template 'edit'
    end
  end

  describe "delete a certain task" do
    it "deletes the task and redirect_to the tasks index" do
      project = FactoryGirl.create(:project)
      task = project.tasks.create(FactoryGirl.attributes_for(:task))
      get :destroy, :project_id => project, :id => task
      response.should redirect_to project_tasks_path
    end
  end
end