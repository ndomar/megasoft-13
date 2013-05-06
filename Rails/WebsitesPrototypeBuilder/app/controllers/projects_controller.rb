# encoding: utf-8
class ProjectsController < ApplicationController

  #To make sure that the designer is logged in
  before_filter :authenticate_designer!

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
  # * *Args*    :
  #   - +pageid+ -> the page's id
  #   - +html+ -> the updated html
  # * *Returns*  :
  #   - void
  #
  def savePage
    @page = Page.find(params[:pageid])  # I am retrieving the page whose id is the provided id
    html = params[:pagehtml]      # I am updating the page's html
    if @page.update_attribute(:html , html)
      # save to file, and commit the changes
      # getting the repo from its folder
      path = "#{Rails.public_path}/#{@page.project_id}"
      repo = Rugged::Repository.new(path)

      # create a new file to add in the repo, skip if file already exists
      file_path = path + "/" + @page.page_name + ".html"
      new_file = !File.exists?(file_path)
      File.open(file_path, "w") do |f|
        f.write(html)   
      end

      # add the files to the list of files to commited
      index = repo.index

      Dir.foreach(path) do |item|
        next if item == '.' or item == '..' or File.directory?(path+"/"+item)
        index.add(item)
      end

      # commiting after adding all files
      options = {}
      options[:tree] = index.write_tree
      options[:author] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
      options[:committer] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
      options[:message] = ((new_file)? "إضافة" : "حفظ") + " صفحة \"#{@page.page_name}\""
      options[:parents] = repo.empty? ? [] : [ repo.head.target ].compact
      options[:update_ref] = 'HEAD'

      Rugged::Commit.create(repo, options)
      load_versions(@page.project_id)
    end
    #@page.delay.take_screenshot("http://localhost:3000/projects/design/#{@page.project_id}")
    @need_to_show_page = false
    respond_to do |format|
      #format.html { render :nothing => true }
      #format.js { render :layout => false }
      format.js {render "show_page", :status => :ok}
    end
  end


  ##
  # Author Hossam
  # called to delete a page in the database
  # finds the page with the given id
  # * *Args*    :
  # - +pageid+ -> the page's id
  # * *Returns*  :
  # - void
  #
  def deletePage
    @page = Page.find(params[:pageid]) 
    @page.destroy
    @pages = Page.find(:all, :conditions => {:project_id => @page.project_id})
    
    # delete file, and commit the changes
    # getting the repo from its folder
    path = "#{Rails.public_path}/#{@page.project_id}"
    repo = Rugged::Repository.new(path)

    # delete file
    file_path = path + "/" + @page.page_name + ".html"
    File.delete(file_path)

    # add the files to the list of files to commited
    index = repo.index

    Dir.foreach(path) do |item|
      next if item == '.' or item == '..' or File.directory?(path+"/"+item)
      index.add(item)
    end

    # commiting after adding all files
    options = {}
    options[:tree] = index.write_tree
    options[:author] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
    options[:committer] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
    options[:message] = "مسح صفحة \"#{@page.page_name}\""
    options[:parents] = repo.empty? ? [] : [ repo.head.target ].compact
    options[:update_ref] = 'HEAD'

    Rugged::Commit.create(repo, options)

    respond_to do |format|
      format.js {render "remove_page", :status => :ok}
    end
  end

  ##
  # Author Hossam
  # called to create a page in the database
  # create a page with the given name in the given project in the database
  # * *Args*    :
  # - +pageName+ -> the page's name
  # - +projectId+ -> current project's id
  # * *Returns*  :
  # - void
  # 
  def createPage
    @page = Page.new(params[:page])
    @page.project_id=params[:projectId]
    @page.page_name=params[:pageName] 
    @pageType = params[:pageType]
    respond_to do |format|
      if (@page.save)
        @pages = Page.find(:all, :conditions => {:project_id => @page.project_id})
        format.js {render "new_page", :status => :created}
        target = "#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html"
        if !File.directory?("#{Rails.public_path}/#{@page.project_id}")
          Dir.mkdir("#{Rails.public_path}/#{@page.project_id}")
          Dir.mkdir("#{Rails.public_path}/#{@page.project_id}/images")
        end
        File.open(target, "w+") do |f|
          f.write("")
        end
      else
        format.js {render "new_page", :status => :ok}
      end
    end
  end

  def create_page
    Page.create!(:project_id => id)
  end

  def load_versions (project_id)
    repo = Rugged::Repository.new("#{Rails.public_path}/#{project_id}")
    @walker = Rugged::Walker.new(repo)
    @walker.push(Rugged::Branch.lookup(repo, "master").tip.oid)
    @walker.sorting(Rugged::SORT_TOPO)

    @versions = []
    @walker.each do |c|
      file_found = false
      c.tree.each do |file|
        if file[:name] == @page.page_name + '.html'
          file_found = true
          break
        end
      end 
      if file_found
        @versions.push(c) 
      end
    end
  end

  ##
  # Author Hossam
  # called to show a page in the design pane
  # shows a page in the design pane
  # * *Args*    :
  # - +pageId+ -> the page's id
  # * *Returns*  :
  # - void
  # 
  def showPage
    @page = Page.find(params[:pageId]) 
    # data = File.read("#{Rails.public_path}/#{@page.project_id}/#{@page.page_name}.html")
    # @page.update_attribute(:html , params[:html])
    @html = ""
    
    repo = Rugged::Repository.new("#{Rails.public_path}/#{@page.project_id}")
    if @page.html != nil and params[:commit] == "-1"
      @html =@page.html.html_safe
    else if params[:commit] != "-1"
        @html = repo.blob_at(params[:commit], @page.page_name + '.html').read_raw.data.to_s.html_safe
        @html.force_encoding('UTF-8')
      end
    end
    load_versions(@page.project_id)

    @id=@page.id
    @need_to_show_page = true
    respond_to do |format|
      format.js {render "show_page", :status => :ok}
    end
  end

  ##
  #Author : samy shihata
  # upload media (image/video) to the server under a specific
  # folder for the project
  # * *Args*    :
  # - none
  # * *Returns*  :
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
  # * *Instance* :
  # - +designer+-> is the logged in designer
  # - +projects+-> are all the projects done by the logged in designer
  # * *Returns* :
  # - Returns all the projects of the logged in designer as string
  def index()
    @designer= Designer.find_by_email(current_designer.email) #Getting the logged in designer
    @projects = Project.find(:all, :conditions => {:designer_id => @designer.id}) #Getting all the projects done by the logged in designer
  end
 
  ##
  #The show method is used, to show a certain project.
  # * *Instance* :
  # - +project+-> is the selected project
  # * *Returns* :
  # - Returns the selected project design page

  ##
  #The create method in project controller class creates a new project with a given parameter and then
  # save it, if it is saved succesfully then redirect to the project created, else render the new view again
  # * *Instance* :
  # - +projects+-> The new created project with the passed parameters
  def create()
    @project = Project.new(params[:project])
    respond_to do |format|
      if (@project.save)
        format.html {redirect_to projects_url, notice: 'Project was successfully created.'}
        
        #create a new repo for the new project
        path = "#{Rails.public_path}"

        if(!Dir.exists? path)
          Dir.mkdir(path)
        end
        path += "/#{@project.id}"
        if(!Dir.exists? path)
          Dir.mkdir(path)
        end
        images_path = path + "/images"
        if(!Dir.exists? images_path)
          Dir.mkdir(images_path)
        end

        File.open("#{Rails.public_path}/#{@project.id}/index.html", "w+") do |f|
          f.write("<html></html>")
        end
        @page = Page.new()
        @page.project_id= @project.id
        @page.page_name= "index"
        @page.save

        repo = Rugged::Repository.init_at(path, false)

        index = repo.index
        index.add("index.html")

        options = {}
        options[:tree] = index.write_tree
        options[:author] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
        options[:committer] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
        options[:message] = "Initial Commit"
        options[:parents] = []
        options[:update_ref] = 'HEAD'

        Rugged::Commit.create(repo, options)

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
  # - + @project +-> is the selected project to be deleted
  # * *Returns* :
  # - void
  #
  def destroy()
    @project = Project.find(params[:id])
    @project.destroy
    FileUtils.remove_dir("#{Rails.public_path}/#{@project.id}", :force => true)
    respond_to do |format|
      format.js { render "project_deleted"}
    end
  end

end