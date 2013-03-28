class TasksController < ApplicationController
  #index takes project_id as attribute,
  # uses it to find project and then the tasks that project has
  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks

    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @tasks }
    end
  end
  #Uses project_id to create task that belongs to the project
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(params[:task])
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @task }
    end
  end
  # Create Report For task id
  def report
    @task = Task.find(params[:id])
    @success = @task.success
    @time_frame = @task.time_frame

    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @task }
    end
  end
  #It creates and saves the new task in the database
  def create
    @task = Task.new(params[:task])
    if @task.save
      respond_to do |format|
      format.html { redirect_to project_tasks_path, notice: @task.project_id }
      format.json { render json: @task, status: :created, location: @task }
      end
    end


    #respond_to do |format|
      #if @task.save
       # format.html { redirect_to @task, notice: 'Task was successfully created.' }
        #format.json { render json: @task, status: :created, location: @task }
      #else
       # format.html { render action: "new" }
        #format.json { render json: @task.errors, status: :unprocessable_entity }
      #end
    #end
  end
  #Shows individual task page
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

end
