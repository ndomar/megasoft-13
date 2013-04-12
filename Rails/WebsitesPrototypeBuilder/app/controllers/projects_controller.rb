class ProjectsController < ApplicationController
  #To make sure that the designer is logged in
  before_filter :authenticate_designer!
  ##
  #The index method is used, to preview all the projects created by the logged in designer
  # * *Instance*    :
  #   - +project+-> The new created project
  
  def new()
    @project = Project.new()
  end

  ##
  #The create method in project controller class creates a new project with a given parameter and then
  # save it, if it is saved succesfully then redirect to the project created, else render the new view again 
  # * *Instance*    :
  #   - +projects+-> The new created project with the passed parameters
    

  def create()
    @project = Project.new(params[:project])
    if @project.save()
      redirect_to @project
    else
      render"new" 
    end
  end
end
