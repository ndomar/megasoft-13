require 'spec_helper'

describe ProjectsController	do	
	
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