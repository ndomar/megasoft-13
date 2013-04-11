require 'spec_helper'

describe ProjectsController do

  #before(:each) do
   # @attr = {
    #  :project_name => "Test Project",
     # :project_type => "Test type",
      #:description => "Description",
      #:designer_id => "1"
   # }
  #end

  it "should create a new instance" do
    get :new
    assigns(:project).should_not be_nil
  end

  it "should create a new instance given a valid attributes" do
    get :create, {:project_name => 'mega', :designer_id => 1}
    assigns(:project).should_not be_nil
  end

end
