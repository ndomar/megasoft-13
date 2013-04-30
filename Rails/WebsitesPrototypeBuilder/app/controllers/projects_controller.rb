class ProjectsController < ApplicationController
def design
end
  #before_filter :authenticate_designer!
  ##
  #The index method is used, to preview all the projects created by the logged in designer
  # * *Instance* :
  # - +designer+-> is the logged in designer
  # - +projects+-> are all the projects done by the logged in designer
  # * *Returns* :
  # - Returns all the projects of the logged in designer as string
  def index
    #@designer= Designer.find_by_email(current_designer.email) #Getting the logged in designer
    #@projects = Project.find(:all, :conditions => {:designer_id => @designer.id}) #Getting all the projects done by the logged in designer
    @projects = Project.all
  end

  ##
  #The show method is used, to show a certain project.
  # * *Instance* :
  # - +project+-> is the selected project
  # * *Returns* :
  # - Returns the selected project design page

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end


  def create
    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.save
        format.html {redirect_to projects_url, notice: 'Project was successfully created.' }
        Dir.mkdir("#{Rails.public_path}/#{@project.id}")
        Dir.mkdir("#{Rails.public_path}/#{@project.id}/images")
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    FileUtils.remove_dir("#{Rails.public_path}/#{@project.id}", :force => true)
    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end
  
end


