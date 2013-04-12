require 'spec_helper'

describe Project do

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

  it "should require a project_name" do
    no_project_name = Project.new(@attr.merge(:project_name => ""))
    no_project_name.should_not be_valid
  end

  it "should not require description" do
    no_description = Project.new(@attr.merge(:description => ""))
    no_description.should be_valid
  end


   it "should reject duplicate project name" do
    Project.create!(@attr)
    project_with_duplicate_project_name = Project.new(@attr)
    project_with_duplicate_project_name.should_not be_valid
  end


end