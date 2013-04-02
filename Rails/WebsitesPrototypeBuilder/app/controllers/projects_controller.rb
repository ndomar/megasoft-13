class ProjectsController < ApplicationController
  #to make sure that the designer is logged in
  before_filter :authenticate_designer! 
  def new()
    #Create a new project
    @project = Project.new() 
  end

  def create()
    #Create a new project with the info passed by the user
    @project = Project.new(params[:project])
    #save, which will return either true ro false
    if @project.save() 
       #so if it returned true, go to the project design page
      redirect_to @project
    else
      #else if it returned false, the project description page will appear again
      render"new" 
    end
  end
end
