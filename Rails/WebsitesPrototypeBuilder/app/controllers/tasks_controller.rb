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
  #Directs to the form of new task 
  def new
    @task = Task.new
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @task }
    end
  end
  #It creates and saves the new task in the database
  #If task saved succesfully it redirects to the tasks index
  #If task is not save it shows the errors
  def create
    @task = Project.find(params[:project_id]).tasks.create(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_tasks_path, notice: "Task Created Succesfully" }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  # Calculates average time_frame and percentage success
  # from task_results of the task and sends thes values 
  # to the view to be displayed
  def report
    @task = Task.find(params[:format])
    @results = @task.task_results
    @count = 1
    @avg = 0
    @success = 0
    @results.each do |result|
      if result.success 
        @success = @success + 1
      end
      @count = @count + 1
      @avg = @avg + result.time_frame
    end
    @success = @success / @count
    @avg = @avg / @count
  end
end
