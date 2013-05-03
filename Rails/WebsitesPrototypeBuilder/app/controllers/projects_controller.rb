class ProjectsController < ApplicationController

  def new
    @project = Project.new
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
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

  ##
  # Author Hossam
  # called to update a page in the database
  # finds the page with the given id and updates its html
  # * *Args* :
  # - +pageid+ -> the page's id
  # - +html+ -> the updated html
  # * *Returns* :
  # - void
  #
  def savePage
    @page = Page.find(params[:pageid])  # I am retrieving the page whose id is the provided id
    @page.html = params[:html]      # I am updating the page's html
    @page.save                      # I am saving the page after updating it
    @page.delay.take_screenshot("http://localhost:3000/projects/design/#{@page.project_id}")
    respond_to do |format|
      format.html { render :nothing => true }
      format.js { render :layout => false }
    end
  end

  ##
  # Author Hossam
  # called to delete a page in the database
  # finds the page with the given id
  # * *Args* :
  # - +pageid+ -> the page's id
  # * *Returns* :
  # - void
  #
  def deletePage
    @page = Page.find(params[:pageid]) 
    @page.destroy
    @pages = Page.find(:all, :conditions => {:project_id => @page.project_id})
    # if @page.file_dir_exists?("app/assets/images/project_#{@page.project_id}/page_#{@page.page_name}")
    #   File.delete(File.expand_path File.dirname("page_#{@page.page_name}"))
    # end
    respond_to do |format|
      format.js {render "remove_page", :status => :ok}
    end
  end

  ##
  # Author Hossam
  # called to create a page in the database
  # create a page with the given name in the given project in the database
  # * *Args* :
  # - +pageName+ -> the page's name
  # - +projectId+ -> current project's id
  # * *Returns* :
  # - void
  #	
  def createPage
    @page = Page.new(params[:page])
    @page.project_id=params[:projectId]
    @page.page_name=params[:pageName] 
    respond_to do |format|
      if (@page.save)
        @pages = Page.find(:all, :conditions => {:project_id => @page.project_id})
        format.js {render "new_page", :status => :created}
      else
        format.js {render "new_page", :status => :ok}
      end
    end
  end

  ##
  # Author Hossam
  # called to show a page in the design pane
  # shows a page in the design pane
  # * *Args* :
  # - +pageId+ -> the page's id
  # * *Returns* :
  # - void
  # 
  def showPage
    @page = Page.find(params[:pageId]) 
    @html = ""
    if @page.html != nil 
      @html =@page.html.html_safe
    end
    @id=@page.id
    respond_to do |format|
      format.js {render "show_page", :status => :ok}
    end
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
    begin
    @originalPageId = params[:page_id]
    @originalPageHTML = Page.find(params[:page_id]).html.html_safe
    rescue
      @originalPageHTML = nil
    ensure
      @project = Project.find(params[:project_id]);
      @medias = @project.medias
      @id = @project.id                                     #I am sending the project id explicitly to the design page
      @pages = Page.find(:all, :conditions => {:project_id => @id}) #I am sending the project pages to the design page    
      respond_to do |format|
        format.html 
        format.json { render json: @project, :status => :ok}
      end
    end
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
  #The create method in project controller class creates a new project with a given parameter and then
  # save it, if it is saved succesfully then redirect to the project created, else render the new view again 
  # * *Instance*    :
  #   - +projects+-> The new created project with the passed parameters
    

  def create()
    @project = Project.new(params[:project])
    respond_to do |format|
      if (@project.save)
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
  # The destroy method in the project controller is used, to delete any particular project
  # * *Instances*   :
  #   - +project+-> is the project to be deleted
  #   - +task+-> are the tasks assigned to this project

  def destroy()
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.js { render "project_deleted", :status => :ok}
    end
  end

end