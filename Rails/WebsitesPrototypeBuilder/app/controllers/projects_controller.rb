class ProjectsController < ApplicationController
  #To make sure that the designer is logged in
  before_filter :authenticate_designer!

  def design
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

  def show()
    @project = Project.find(params[:id])

  end
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
        format.js {render "create", :status => :created }

        #create a new repo for the new project
        path = "#{Rails.public_path}/projects"

        if(!Dir.exists? path)
          Dir.mkdir(path)
        end
        path += "/#{@project.id}"
        if(!Dir.exists? path)
          Dir.mkdir(path)
        end
        if(!Dir.exists? path+"/images")
          Dir.mkdir(paht +"/images")
        end

        repo = Rugged::Repository.init_at(path, false)

        index = repo.index

        options = {}
        options[:tree] = index.write_tree
        options[:author] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
        options[:committer] = { :email => "ahmadsoliman@github.com", :name => 'Ahmad Soliman', :time => Time.now }
        options[:message] = "Initial Commit"
        options[:parents] = []
        options[:update_ref] = 'HEAD'

        Rugged::Commit.create(repo, options)

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
    @task = Task.find(:all, :conditions => {:project_id => @project.id})
    @project.destroy
    respond_to do |format|
      format.js { render "project_deleted", :status => :ok}
    end
  end
end
