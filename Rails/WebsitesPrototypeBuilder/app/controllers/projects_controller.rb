class ProjectsController < ApplicationController


  def show   
    @project = Project.find(params[:id])   #I am sending the project to the design page
    @id = @project.id                      #I am sending the project id explicitly to the design page
    @pages = Page.find(:all, :conditions => {:project_id => @id}) #I am sending the project pages to the design page    
    respond_to do |format|
      format.html 
      format.json { render json: @project }
    end
  end

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

  # called to create a new comment in the database
  # finds the page with the given id
  # * *Args* :
  # - +id+ -> the page's id
  # - +html+ -> the updated html
  # * *Returns* :
  # - page will be updated with the new content
  #
  def save
    @page = Page.find(params[:id])  # I am retrieving the page whose id is the provided id
    @page.html = params[:html]      # I am updating the page's html
    @page.save                      # I am saving the page after updating it
    respond_to do |format|
      format.html { render :nothing => true }
      format.json { head :no_content }
    end
  end

	def design
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


