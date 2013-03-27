class ProjectController < ApplicationController
  def index
    @projects = Project.order("name").all()

    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @projects }
    end
  end
end
