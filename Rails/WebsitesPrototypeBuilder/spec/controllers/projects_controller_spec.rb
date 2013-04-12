require 'spec_helper'

describe ProjectsController do

  it "should create a new instance given a valid attributes" do
    count_before = Project.all.count
    puts count_before
    get :create, :project => {:project_name => 'kjhgf', :designer_id => 1}
    count_after = Project.all.count
    puts count_after
    count_before.should be < count_after

  end

end