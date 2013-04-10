require 'spec_helper'

describe ProjectsController do

  before(:each) do
    @project = FactoryGirl.create(:project)
  end

  it "should delete a project" do
   delete :destroy, :id => @project.id
  end

end

