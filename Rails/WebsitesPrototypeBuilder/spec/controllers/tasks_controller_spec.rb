require 'spec_helper'

describe TasksController do
  
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

end