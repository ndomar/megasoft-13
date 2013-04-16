require 'spec_helper'

describe ProjectsController	do	
	it "Testing save in projects controller" do
		pageCreated=Page.new()
		pageCreated.save
		get :save, {:id => 1,:html => "asdasdas"}
		assigns(:page).should_not be_nil
	end

it "Testing show in projects controller" do
		projectCreated = Project.new()
		projectCreated.save
		get :show, {:id => 1}
		assigns(:project).should_not be_nil
	end
end
