class TasksController < ApplicationController
  #index method displays all tasks
  def index 
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end
  
  #show method displays a certain task ; given its id.
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task}
    end
  end
  
  #new method: creates a new instance of Task
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task }
    end
  end
  
  #Share method: finds the current task and passes its url to the method post_on_fb to be shared on fb
  def share
    @task = Task.find(params[:id])
    #Designer.post_on_fb(params[:url])
  end
  
  #create method: creates a new task given it's attributes
  def create
    @task= Task.new(params[:task])
    if @task.save
      redirect_to @task
      else
        # This line overrides the default rendering behavior, which
        # would have been to render the "create" view.
        render :action => "new"
    end
  end
end
