require 'spec_helper'

describe ProjectsController do
  before(:each) do
    @designer = FactoryGirl.create(:designer)
    sign_in(@designer)
  end

  it"should create a new project" do
    count_before  = Project.all.count
    post :create, project: {:project_name => 'Some name', :project_type => 'type', :description => 'hello', :designer_id => '1'}
    count_after  = Project.all.count
    count_after.should be > count_before
  end

end


describe ProjectsController do

  before(:each) do
    @project = FactoryGirl.create(:project)
  end

  it "should delete a project" do
   delete :destroy, :id => @project.id
  end

end