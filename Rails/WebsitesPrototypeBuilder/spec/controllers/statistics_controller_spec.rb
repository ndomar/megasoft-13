require 'spec_helper'

describe StatisticsController do
  it "renders the index template and sets the tasks variable" do
    project = FactoryGirl.create(:project)
    task1 = project.tasks.create(FactoryGirl.attributes_for(:task))
    task2 = project.tasks.create(FactoryGirl.attributes_for(:task))
    get :index, :project_id => project, :taskid => {:current_task => task1.id, :task_id => task2.id}
    response.should render_template('index')
    assigns(:tasks).should_not be_nil
    assigns(:chosentasks).should_not be_nil
  end
end
