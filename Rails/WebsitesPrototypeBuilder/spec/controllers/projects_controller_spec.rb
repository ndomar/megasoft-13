require 'spec_helper'

describe ProjectsController	do	

	it "Testing save in projects controller" do
		page = Page.new(:html => "<div><button>Hi</button></div>" ,:page_name => "Hossam Testing")
		page.save
		get :savePage,{:pageid => 1 , :html => "<p>Hossam Testing</p>"}
	end

	it "Testing createPage in projects controller" do
		project = Project.create(:project_name => "Hossam Test")
		project.save
		get :createPage,{:pageName => "Hossam Test",:projectId => project.id}
		controller.should render_template(:status => 'created',:format => 'js')
		get :createPage,{:pageName => "Hossam Test",:projectId => project.id}
		controller.should render_template(:status => 'ok',:format => 'js')
	end

	it "Testing show in projects controller" do
		project = Project.new(:project_name => "Hossam Testing")
		project.save
		get :show, {:id => 1}
	end

	it "Testing deletePage in projects controller" do
		project = Project.new(:project_name => "Hossam Testing")
		project.save
		page = Page.new(:page_name => "Hossam Testing", :project_id => project.id)
		page.save
		get :deletePage, {:pageid => page.id}
		controller.should render_template(:status => 'ok',:format => 'js')
	end
	
end