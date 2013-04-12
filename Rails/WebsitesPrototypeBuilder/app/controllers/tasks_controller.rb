class TasksController < ApplicationController

## 
#finds the current task, it's page, creates a new instance of step_answer and task_result
# * *Args*    :
#   -+@task+ -> the current task
#   -+@page+ -> the current task's page
#   -+@step+ -> the first step of the current task
#   -+@step_answer+ -> a new instance of step_answer contains the info of the current step
#   -+@task_result+ -> a new instance of task_result contains the info about the current task's results
# * *Returns*    :
# - the current task, current step, step_answer for the current_task and task_result for the current task
#
  def task_reviewer
    if Project.all.last.id <= params[:project_id].to_f

      @project=Project.find(params[:project_id])
      @reviewer= Reviewer.find(params[:reviewer_id])
      @task= @project.tasks.find(params[:task_id])
      @page= Page.find(1)
      @step=@task.steps.find(params[:step_id])
      @step_answer=@step.step_answers.new
      @step_answer.save
      @task_result=@task.task_results.new
      @task_result.save
      session[:task_result_id]= @task_result.id 
    else
      format.html { render :template => "tasks/task_reviewer_error" }
    end
  end
  ## 
  #Method index gets all the tasks from the database
  #* *Args*
  #-++->:
  #* *Returns*:
  #-all the tasks and their details as an html page
  #
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  ##
  #show a specific task by searchinng for its id
  #* *Args*    :
  #   -+Task+->: an instance of the class task
  #* *Returns*    :
  #   -the details of this task and renders itas an html
  #
  
  
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  ##
  #define a new task
  
  
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task }
    end
  end

  # GET /tasks/1/edit
  ##
  #edit an existing task
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, :notice => 'Task was successfully created.' }
        format.json { render :json => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, :notice => 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  ##
  # Displays a task and its current steps to allow the designer to edit the steps.
  # * *Args*    :
  #   - +id+ ->: The id of the task for which the steps will be edited.
  # * *Returns*  :
  #   -The page this task is associated with, and the steps added to the task.
  #

  def edit_steps
    @task = Task.find(params[:id])
    @steps = @task.steps
    @page = @task.page
  end

  ##
  # Adds a new step to the task.
  # * *Args*    :
  #   - +task+ ->: The id of the task for which the step will be added.
  #   - +event+ ->: The event associated with the step.
  #   - +component+ ->: The component associated with the step.
  #   - +description+ ->: The description for the step.
  # * *Returns*  :
  #   -The list of new steps if the step was successfully added, or an error if the step could not be saved.
  #

  def new_step
    @step = Step.new(:task_id => params[:id], :event => params[:event], :component => params[:component], :description => params[:description])
    @created = @step.save
    @task = Task.find_by_id(params[:id])
    @steps = @task.steps
    respond_to do |format|
      if @created
        format.js {render "step_list"}
      else
        format.js {render "error"}
      end
    end
  end

  ##
  # Deletes a step from a task.
  # * *Args*    :
  #   - +id+ ->: The id of the step to be deleted.
  #   - +task+ ->: The id of the task from which the step is to be deleted.
  # * *Returns*  :
  #   -The new list of steps after deletion.
  #

  def delete_step
    @task = Task.find_by_id(params[:task])
    @step = Step.find(params[:id])
    @step.destroy
    @steps = @task.steps
    respond_to do |format|
      format.html {render :nothing => true}
      format.js {render "step_list"}
    end
  end

end
