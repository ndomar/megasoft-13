class ProjectsController < ApplicationController
  before_filter :authenticate_designer! 
  
  def new()
    @project = Project.new() #Create a new Project
  end

  def create()
    @project = Project.new(params[:project]) #Create the new project with the info passed by the user
    if @project.save() #save, which will return either true or false
      redirect_to projects_path # if it returned true -> go back to the index page
    else
      render"new" # else if not, returned false ->the project description page will appear again 
    end
  end

end
