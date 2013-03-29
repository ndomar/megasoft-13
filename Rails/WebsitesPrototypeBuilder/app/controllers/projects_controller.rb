class ProjectsController < ApplicationController
  before_filter :authenticate_designer! 
  def index()
    @designer= Designer.find(current.designer_username) #Getting the logged in designer
    @projects = Project.find(:all, :conditions => {:designer_id => '@designer.id'}) #Getting all the projects done by the logged in designer
  end

end
