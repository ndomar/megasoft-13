require "spec_helper"

describe TasksController do 

  it "should find task & step. create new step_answer & task_result" do
    p=Project.new
    p.id=1
    p.project_name='project1'
    p.save
    t=Task.new
    t.id=1
    t.name='task'
    t.project_id=1
    t.save
    p=Page.new
    p.id=1
    p.save
    s=Step.new
    s.id=1
    s.task_id=1
    s.description='x'
    s.event='click'
    s.component='cmp'
    s.save
    r=Reviewer.new
    r.id=1
    r.save

    get  :task_reviewer ,{ :project_id => 1 , :task_id => 1, :step_id => 1 ,:reviewer_id => 1}
    assigns (:task).should_not be_nil
    assigns (:reviewer).should_not be_nil
    assigns (:step).should_not be_nil
    assigns (:page).should_not be_nil
    assigns (:step_answer).should_not be_nil
    assigns (:task_result).should_not be_nil

 end

  
  it "Refuses to add new step with no parameters" do
    task = FactoryGirl.create(:task)
    get :new_step, id: task.id
    assigns(:created).should be_false
  end

  it "Adds new step with correct paramters" do
    task = FactoryGirl.create(:task)
    xhr :get, :new_step, id: task, event: "onclick", component: "test1", description: "test2"
    assigns(:created).should be_true
    assigns(:step).task_id.should == task.id
    assigns(:step).event.should  == "onclick"
    assigns(:step).component.should == "test1"
    assigns(:step).description.should == "test2"
  end

  it "Deletes a step" do
    task = FactoryGirl.create(:task)
    step = FactoryGirl.create(:step)
    countBefore = task.steps.count
    get :delete_step, task: task, id: step
    countAfter = task.steps.count
    countBefore.should be > countAfter
  end

  it "renders the edit_step view" do
    task = FactoryGirl.create(:task)
    get :edit_steps, id: task
    response.should render_template("edit_steps")
  end

  describe "CRUD actions test" do 
    before(:each) do
      controller.class.skip_before_filter :authenticate_designer!
      controller.class.skip_before_filter :checkDesigner
      designer = FactoryGirl.create(:designer)
      @project = FactoryGirl.create(:project)
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
end