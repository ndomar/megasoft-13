require "spec_helper"

describe TasksController do 
  before(:each) do
    @designer = FactoryGirl.create(:designer)
    @project = FactoryGirl.create(:project)
    @page = FactoryGirl.create(:page)
    @task = FactoryGirl.create(:task)
    sign_in(@designer)
  end

  it "should find task & step. create new step_answer & task_result", sarah: true do
    controller.class.skip_before_filter :authenticate_designer!
    controller.class.skip_before_filter :checkDesigner
    project=Project.create(:id => 1 , :project_name => 'project1',:designer_id => '1')
    task=Task.create(:id => 1 ,:name => 'task1' , :project_id => 1)
    page=Page.create(:id => 1 , :project_id => 1)
    step= Step.create(:id => 1, :task_id => 1, :description => 'x', :component => 'cmp')
    reviewer=Reviewer.create(:id => 1)

    get  :task_reviewer ,{ :project_id => 1 , :task_id => 1, :step_id => 1 ,:reviewer_id => 1}
    assigns(:project).should_not be_nil
    assigns (:task).should_not be_nil
    assigns (:reviewer).should_not be_nil
    assigns (:step).should_not be_nil
    assigns (:page).should_not be_nil
    assigns (:task_result).should_not be_nil

 end

 it "Should render error if the project is not found" do
    controller.class.skip_before_filter :authenticate_designer!
    controller.class.skip_before_filter :checkDesigner
    project=Project.create(:id => 1 , :project_name => 'project1',:designer_id => '1')
    task=Task.create(:id => 1 ,:name => 'task1' , :project_id => 1)
    page=Page.create(:id => 1 , :project_id => 1)
    step= Step.create(:id => 1, :task_id => 1, :description => 'x', :component => 'cmp')
    reviewer=Reviewer.create(:id => 1)
  get :task_reviewer ,{ :project_id => 100 , :task_id => 1, :step_id => 1 ,:reviewer_id => 1}
  response.should render_template('task_reviewer_error')
end

 it "Should render error if the task is not found" do  
    controller.class.skip_before_filter :authenticate_designer!
    controller.class.skip_before_filter :checkDesigner
    project=Project.create(:id => 1 , :project_name => 'project1',:designer_id => '1')
    task=Task.create(:id => 1 ,:name => 'task1' , :project_id => 1)
    page=Page.create(:id => 1 , :project_id => 1)
    step= Step.create(:id => 1, :task_id => 1, :description => 'x', :component => 'cmp')
    reviewer=Reviewer.create(:id => 1)
  get :task_reviewer ,{ :project_id => 1, :task_id => 100, :step_id => 1 ,:reviewer_id => 1}
  response.should render_template('task_reviewer_error')
end
  
  it "Refuses to add new step with no parameters" do
    task = FactoryGirl.create(:task)
    get :new_step, id: task.id
    assigns(:created).should be_false
  end
  describe "Steps Related tasks" do
    it "Refuses to add new step with no parameters" do
      get :new_step, project_id: @project, id: @task
      assigns(:created).should be_false
    end

    it "Adds new step with correct paramters" do
      xhr :get, :new_step, project_id: @project, id: @task, event: "onclick", component: "test1", description: "test2", page_id: @page
      assigns(:created).should be_true
      assigns(:step).task_id.should == @task.id
      assigns(:step).page_id.should == @page.id
      assigns(:step).event.should  == "onclick"
      assigns(:step).component.should == "test1"
      assigns(:step).description.should == "test2"
    end

    it "Deletes a step" do
      step = FactoryGirl.create(:step)
      countBefore = @task.steps.count
      get :delete_step, project_id: @project, task: @task, id: step
      countAfter = @task.steps.count
      countBefore.should be > countAfter
    end
  end

  describe "Edit_Steps" do

    it "renders the edit_step view" do
      get :edit_steps, project_id: @project, id: @task
      response.should render_template("edit_steps")
    end

    it "refuses to render view with designer signed out" do
      sign_out(@designer)
      get :edit_steps, project_id: @project, id: @task
      response.should_not render_template("edit_steps")
    end

    it "refuses to render view with task page not defined" do
      @task.page_id = nil
      @task.save
      get :edit_steps, project_id: @project, id: @task
      response.should_not render_template("edit_steps")
      response.should render_template("select_start_page")
    end

    it "refuses to render view with designer not related to project" do
      @project.designer_id = 1 + @project.designer_id
      @project.save
      get :edit_steps, project_id: @project, id: @task
      response.should_not render_template("edit_steps")
    end

  end

  describe "CRUD actions test" do 
    before(:each) do
      designer = FactoryGirl.create(:designer)
      sign_in(designer)
      @project = designer.projects.create(FactoryGirl.attributes_for(:project))
      @task = @project.tasks.create(FactoryGirl.attributes_for(:task))
    end
  
    it "renders index view" do
      get :index, :project_id => @project
      response.should render_template('index')
    end
    
    it "redirects to new view" do
      get :new, :project_id => @project
      response.should render_template('new')
    end
    
    it "creates instance task that belongs to project id and has name field" do 
      get :create, :project_id => @project, :task => @task.attributes
      response.should redirect_to project_tasks_path
    end

    it "renders new view if name field is missing" do
      get :create, :project_id => @project, :task => {:name => ""}
      response.should render_template 'new'
    end

    it "redirects to edit view" do
      get :edit, :project_id => @project, :id => @task
      response.should render_template('edit')
    end
    
    it "redirects to index after updating the parameters" do
      get :update, :project_id => @project, :id => @task, :task => {:name => "Edited Test"}
      response.should redirect_to project_tasks_path
    end

    it "renders edit view if name field is missing" do
      get :update, :project_id => @project, :id => @task, :task => {:name => ""}
      response.should render_template 'edit'
    end
    
    it "deletes the task and redirect_to the tasks index" do
      get :destroy, :project_id => @project, :id => @task
      response.should redirect_to project_tasks_path
    end

    it "renders the show view of the task" do
      get :show, :project_id => @project, :id => @task
      response.should render_template 'show'
    end
  end

  describe "post invite use" do
    it "gets parameters correctly" do
      controller.class.skip_before_filter :authenticate_designer!
      controller.class.skip_before_filter :checkDesigner
      project = FactoryGirl.create(:project)
      task = project.tasks.create(FactoryGirl.attributes_for(:task))
      email = "ahmed.osama.saad@gmail.com"
      msg = "hello"
      post :invite_user, :email => email, :invitation_message => msg, :task_id => task.id, :project_id => project.id
      assigns(:email).should eq(email)
      assigns(:invitation_message).should eq(msg)
      assigns(:task_id).should eq(task.id.to_s)
      assigns(:project_id).should eq(project.id.to_s)
    end
  end
  
  describe "show the log page of a task result" do
    it "renders the log view of the task" do
      project = FactoryGirl.create(:project)
      task = project.tasks.create(FactoryGirl.attributes_for(:task))
      task_result = task.task_results.create(FactoryGirl.attributes_for(:task_result))
      log = task_result.logs.create(FactoryGirl.attributes_for(:log))
      get :log, :project_id => project, :task_id => task, :result_id => task_result, :id => log
      response.should render_template 'log'
    end
  end
end