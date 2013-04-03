class ProjectsController < ApplicationController
  #To make sure that the designer is logged in
  before_filter :authenticate_designer! 

    ##
    #Create a new project

  def new()
    @project = Project.new() 
  end

    ##
    #Create a new project with the info passed by the user (peoject_name : string , Project_type :String, Description : string)
    #then save(), which will return either true ro false
    #so if it returned true, go to the project design page
    #else if it returned false, the project description page will appear again

  def create()
    @project = Project.new(params[:project])
    if @project.save() 
      redirect_to @project
    else
      render"new" 
    end
  end
end
