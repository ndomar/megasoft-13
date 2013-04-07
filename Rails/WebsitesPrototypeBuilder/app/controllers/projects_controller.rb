class ProjectsController < ApplicationController
  before_filter :authenticate_designer! 
  def index()
    @designer= Designer.find_by_email(current_designer.email) #Getting the logged in designer
    @projects = Project.find(:all, :conditions => {:designer_id => @designer.id}) #Getting all the projects done by the logged in designer
  end

  def destroy()
    @project = Project.find(params[:id])
    @task = Task.find(:all, :conditions => {:project_id => @project.id})
    @project.destroy
    redirect_to projects_path
  end
end
