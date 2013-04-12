require 'spec_helper'

describe ProjectsController do

   before(:each) do
    @attr = {
      :project_name => 'Test Project',
      :project_type => 'Test type',
      :description => 'Description',
      :designer_id => 2
    }
  end

  it "should create a new instance given a valid attributes" do
    count_before = Project.all.count
    puts count_before
    Project.create(@attr)
    count_after = Project.all.count
    puts count_after
    count_before.should be < count_after

  end


end
