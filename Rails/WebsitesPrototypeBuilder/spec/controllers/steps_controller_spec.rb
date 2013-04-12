require 'spec_helper'
describe StepsController do
  it "should update values of step_answer & task_result according to success of steps" do
    t=Task.new
    t.id=1
    t.name='taaask'
    t.save
    s=Step.new
    s.id=1
    s.task_id=1
    s.save
    p=Page.new
    p.id='1'

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
    t=Task.new
    t.id=1
    t.name='taaask'
    t.save
    s=Step.new
    s.id=1
    s.task_id=1
    s.save
  post :update,{ :task_id => 1,:change_id => 6 , :change_success => 'true', :start_time => '14:28:38' ,:task_result_id => 1, :change_clicks => 2, :total_time_taken => 3}
    response.should render_template("task_reviewer_done")
  end
end