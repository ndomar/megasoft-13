class ProjectsController < ApplicationController
  def new
    @project = Project.new

    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_page
     Page.create!(:project_id => id)
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

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
  #before_filter :authenticate_designer! 
  ##
  #The index method is used, to preview all the projects created by the logged in designer
  # * *Instance*    :
  #   - +designer+-> is the logged in designer 
  #   - +projects+-> are all the projects done by the logged in designer
  # * *Returns*  :
  #   - Returns all the projects of the logged in designer as string      
  def index()
    #@designer= Designer.find_by_email(current_designer.email) #Getting the logged in designer
    #@projects = Project.find(:all, :conditions => {:designer_id => @designer.id}) #Getting all the projects done by the logged in designer
    @projects = Project.all  
  end      
  
end

