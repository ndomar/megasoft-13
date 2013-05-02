require 'spec_helper'
describe StepsController do
  it "should update values of step_answer & task_result according to success of steps" do
    project=Project.create(:id => 1 , :project_name => 'project1')
    task=Task.create(:id => 1 ,:name => 'task1' , :project_id => 1)
    reviewer=Reviewer.create(:id => 1)
  post :update,{ :task_id => 1,:change_id => 2 , :change_success => 'true', :start_time => '14:28:38' ,:task_result_id => 1, :change_clicks => 2, :total_time_taken => 3}
    assigns (:task).should_not be_nil
    assigns (:step).should_not be_nil
    assigns (:task_result).should_not be_nil
    response.should render_template("task_reviewer")
  end

  it "should render the 'done' view because the task is successfully done" do
    project=Project.create(:id => 1 , :project_name => 'project1')
    task=Task.create(:id => 1 ,:name => 'task1' , :project_id => 1)
    page=Page.create(:id => 1 , :project_id => 1)
    reviewer=Reviewer.create(:id => 1)
  post :update,{ :task_id => 1,:change_id => 6 , :change_success => 'true', :start_time => '14:28:38' ,:task_result_id => 1, :change_clicks => 2, :total_time_taken => 3}
    response.should render_template("task_reviewer_done")
  end
end
