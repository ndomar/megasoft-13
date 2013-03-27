class TasksController < ApplicationController
  def index 
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end
  
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task}
    end
  end
  
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task }
    end
  end
  
  def share
    @task = Task.find(params[:id])
    #Designer.post_on_fb(params[:url])
  end
  
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

  
   
  
  def share_on_fb
  end 
    
end
