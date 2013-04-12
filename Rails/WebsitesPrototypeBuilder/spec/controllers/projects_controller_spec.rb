require 'spec_helper'

describe ProjectsController	do	
	it "Testing save in projects controller" do
		p=Page.new()
		p.save
		get :save, {:id => 1,:html => "asdasdas"}
		assigns(:page).should_not be_nil
	end

it "Testing show in projects controller" do
		p = Project.new()
		p.save
		get :show, {:id => 1}
		assigns(:project).should_not be_nil
	end
end
