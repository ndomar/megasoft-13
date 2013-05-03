require 'spec_helper'

describe ProjectsController do
  before(:each) do
    @designer = FactoryGirl.create(:designer)
    sign_in(@designer)
  end

  it"should create a new project" do
    count_before  = Project.all.count
    puts @count_before
    post :create, project: {:project_name => 'holaa', :project_type => 'type', :description => 'hello', :designer_id => '1'}
    count_after  = Project.all.count
    puts @count_after
    count_after.should be > count_before
  end

end


describe ProjectsController do

  before(:each) do
    @designer = FactoryGirl.create(:designer)
    sign_in(@designer)
    @project = FactoryGirl.create(:project)
  end

  it "should delete a project" do
    count_before  = Project.all.count
    delete :destroy, :id => @project.id
    count_after  = Project.all.count
    count_after.should be < count_before
  end
end

describe ProjectsController do 
  it "should create a new media record" do
    count_before = Media.all.count
    post "upload_media"
    count_after = Media.all.count
    count_before.should be < count_after
  end 
end