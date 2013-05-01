require 'spec_helper'
describe StepsController do
  it "should update values of step_answer & task_result according to success of steps" do
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

  post :update,{ :task_id => 1,:change_id => 2 , :change_success => 'true', :start_time => '14:28:38' ,:task_result_id => 1, :change_clicks => 2, :total_time_taken => 3}
    assigns (:task).should_not be_nil
    assigns (:step).should_not be_nil
    assigns (:pre_step).should_not be_nil
    assigns (:step_answer).should_not be_nil
    assigns (:task_result).should_not be_nil
    assigns (:page).should_not be_nil
    response.should render_template("task_reviewer")
  end

  it "should render the 'done' view because the task is successfully done" do
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
  post :update,{ :task_id => 1,:change_id => 6 , :change_success => 'true', :start_time => '14:28:38' ,:task_result_id => 1, :change_clicks => 2, :total_time_taken => 3}
    response.should render_template("task_reviewer_done")
  end
end
