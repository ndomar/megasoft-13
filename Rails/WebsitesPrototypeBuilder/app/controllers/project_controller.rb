class ProjectController < ApplicationController
  #Sends to the view an array of all available projects to display
  def index
    @projects = Project.all()

    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @projects }
    end
  end
end
