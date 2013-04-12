require 'spec_helper'

describe TasksController do
  
  it "Adds New Step with no parameters" do
    get :new_step
    assigns(:created).should be_false
  end

  it "Adds new step with all paramters" do
    task = FactoryGirl.create(:task)
    get :new_step, id: task, event: "onclick", component: "test1", description: "test2"
    assigns(:created).should be_true
  end

end