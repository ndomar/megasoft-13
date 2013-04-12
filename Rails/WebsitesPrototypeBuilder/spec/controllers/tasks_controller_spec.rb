require 'spec_helper'
describe TasksController do
  it "should find task & step. create new step_answer & task_result" do
    p=Project.new
    p.id=1
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
    s.save
    r=Reviewer.new
    r.id=1
    r.save

    get  :task_reviewer ,{ :project_id => 1 , :task_id => 1, :step_id => 1 ,:reviewer_id => 1}
    assigns (:task).should_not be_nil
    assigns (:step).should_not be_nil
    assigns (:page).should_not be_nil
    assigns (:step_answer).should_not be_nil
    assigns (:task_result).should_not be_nil

  end
end