class ProjectsController < ApplicationController
  before_filter :authenticate_designer!
  ##
  #The index method is used, to preview all the projects created by the logged in designer
  # * *Instance*    :
  #   - +designer+-> is the logged in designer 
  #   - +projects+-> are all the projects done by the logged in designer
  # * *Returns*  :
  #   - Returns all the projects of the logged in designer as string      
  def index()
    @designer= Designer.find_by_email(current_designer.email) #Getting the logged in designer
    @projects = Project.find(:all, :conditions => {:designer_id => @designer.id}) #Getting all the projects done by the logged in designer
  end

  ##
  # The destroy method in the project controller is used, to delete any particular project
  # * *Instances*   :
  #   - +project+-> is the project to be deleted
  #   - +task+-> are the tasks assigned to this project

  def destroy()
    @project = Project.find(params[:id])
    @task = Task.find(:all, :conditions => {:project_id => @project.id})
    @project.destroy
    redirect_to projects_path
  end

end
