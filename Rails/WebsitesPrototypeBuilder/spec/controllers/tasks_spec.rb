require 'spec_helper'

describe TasksController do

  describe "GET index" do

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
  end


  describe "GET #show" do
    it "assigns the requested task to @task" do
      task = FactoryGirl.create(:task)
      get :show, id: task
      assigns(:task).should eq(task)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:task)
      response.should render_template("show")
    end
  end
end


