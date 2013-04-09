require 'spec_helper'

describe ProjectsController do

  before(:each) do
    @attr = {
      :project_name => "Test Project",
      :project_type => "Test type",
      :description => "Description",
      :designer_id => "1"
    }
  end

  it "should create a new instance given a valid attribute" do
   Project.create!(@attr)
  end

end
