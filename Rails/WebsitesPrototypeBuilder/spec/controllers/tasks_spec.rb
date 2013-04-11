require 'spec_helper'

describe TasksController do
  before(:each) do
    @task = {
      :name => "test task"
      :description => "this a test task"
      
    }
  end
  describe "GET index" do

    it "renders the index template" do
      get :index
      response.should render_template("index")
    end
    describe "GET show" do
      it "renders the show template" do
      get :show
      response.should render_template("show")
    end
  end
  end
end


