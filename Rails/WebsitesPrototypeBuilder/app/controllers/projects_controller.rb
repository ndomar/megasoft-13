class ProjectsController < ApplicationController

  #To make sure that the designer is logged in
  before_filter :authenticate_designer!

  def create_page
     Page.create!(:project_id => id)
  end

  ##
  # upload media (image/video) to the server under a specific
  # folder for the project
  # * *Args* :
  # - none
  # * *Returns* :
  # - void
  #
  def upload_media
    name = request.headers["HTTP_X_FILENAME"]
    project_id = request.headers["HTTP_PROJECT_ID"]
    data = request.raw_post
    @media = Media.new(url: name, project_id: project_id)
    @media.store_media(name, data, project_id)

    respond_to do |format|
      if @media.save
        format.html { render :nothing => true, :status => :created }
      else
        format.html { render :nothing => true, :status => 406 }
      end
    end
  end

  def design
    @project = Project.find(params[:project_id]);
    @medias = @project.medias
  end

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
  #The show method is used, to show a certain project.
  # * *Instance*    :
  #   - +project+-> is the selected project 
  # * *Returns*  :
  #   - Returns the selected project design page       

  ##
  #The new method is used, to create a new project
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
    respond_to do |format|
      if (@project.save)
        format.html {redirect_to projects_url, notice: 'Project was successfully created.'}
        if !File.directory?("#{Rails.public_path}/#{@project.id}")
          Dir.mkdir("#{Rails.public_path}/#{@project.id}")
        File.open("#{Rails.public_path}/#{@project.id}/index.html", "w+") do |f|
          f.write("")
          end
        end
        if !File.directory?("#{Rails.public_path}/#{@project.id}/images")
          Dir.mkdir("#{Rails.public_path}/#{@project.id}/images")
        end
        @page = Page.new()
        @page.project_id= @project.id
        @page.page_name= "index"
        @page.save
        @page.delay.take_screenshot("http://localhost:3000/projects/design/#{@project.id}/?page_id=#{@page.id}")
        format.js {render "create", :status => :created }
      else
        format.js {render "create", :status => :ok}
      end
    end
  end

  ##
  # Delete project and it's folder
  # * *Args* :
  #   - + @project +-> is the selected project to be deleted
  # * *Returns* :
  # - void
  #
  def destroy()
    @project = Project.find(params[:id])
    @project.destroy
    FileUtils.remove_dir("#{Rails.public_path}/#{@project.id}", :force => true)
    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end

end
