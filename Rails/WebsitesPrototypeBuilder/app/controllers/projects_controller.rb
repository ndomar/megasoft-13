class ProjectsController < ApplicationController
  before_filter :authenticate_designer! 
  def index()
    @designer= Designer.find_by_email(current_designer.email) #Getting the logged in designer
    @projects = Project.find(:all, :conditions => {:designer_id => @designer.id}) #Getting all the projects done by the logged in designer
  end

  def show()
    @project = Project.find(params[:id])

  end
  
end
