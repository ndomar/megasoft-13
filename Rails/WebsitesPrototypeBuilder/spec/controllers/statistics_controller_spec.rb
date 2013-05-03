require 'spec_helper'

describe StatisticsController do
  it "renders the index template and sets the tasks variable" do
    project = FactoryGirl.create(:project)
    task1 = project.tasks.create(FactoryGirl.attributes_for(:task))
    questionnaire1 = project.questionnaires.create(FactoryGirl.attributes_for(:questionnaire))
    get :index, :project_id => project, :task => {:id => task1.id}, :questionnaire => {:id => questionnaire1.id}
    response.should render_template('index')
    assigns(:tasks).should_not be_nil
    assigns(:chosentasks).should_not be_nil
    assigns(:chosenquestionnaire).should_not be_nil
  end
end