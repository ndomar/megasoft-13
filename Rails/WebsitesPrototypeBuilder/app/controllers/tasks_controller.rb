 # encoding: utf-8
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
    if Integer(Project.all.last.id) >= Integer(params[:project_id]) && Project.all.first.id <= Integer(params[:project_id])
      @project=Project.find(params[:project_id])
      @reviewer= Reviewer.find(params[:reviewer_id])

      if !@project.tasks.empty? && Integer(@project.tasks.last.id) >= Integer(params[:task_id]) && @project.tasks.first.id <= Integer(params[:task_id])
        @task= @project.tasks.find(params[:task_id])
        @page= @project.pages.find(@task.page_id)
        @step=@task.steps.first
        @step_answer=@step.step_answers.new
        @step_answer.save
        @task_result=@task.task_results.new
        @task_result.reviewer_id=@reviewer.id
        @task_result.success='false'
        @task_result.clicks= 0
        @task_result.save
        session[:task_result_id]= @task_result.id
      else
        respond_to do |format|
          format.html { render :template => "tasks/task_reviewer_error" }
        end
      end
    else
      respond_to do |format|
        format.html { render :template => "tasks/task_reviewer_error" }
      end
    end
  end
  ## 
  # passes the list of tasks that belongs to the project to the index view
  # * *Args*    :
  #   -+project_id+->: id of current project
  # * *Returns* :
  #   - list of tasks that belongs to project_id
  #
  def index
    @tasks = Project.find(params[:project_id]).tasks.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end
  
  ## 
  # Make a new instance of task and render new view that has the form
  # * *Args*    :
  #   -+project_id+->: id of current project
  # * *Returns* :
  #   -renders form to create new task
  #
  def new
    @pages = Project.find(params[:project_id]).pages
    @task = Task.new

    @pageslist = []

    @pages.each do |p|
      a = @pageslist.length
      @pageslist[a] = [p.page_name, p.id]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  ##
  # show a specific task by searchinng for its id
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

  ## 
  # Find the task with the project_id and render edit view that has the form to edit the task
  # * *Args*    :
  #   -+project_id+->: id of current project
  #   -+id+->: id of current task
  # * *Returns* :
  #   -returns the task to be edited and renders the edit form
  #
  def edit
    @task = Project.find(params[:project_id]).tasks.find(params[:id])
  end

  ## 
  # Use the :task parameter to create an instance of tasks related to current project
  # * *Args*    :
  #   -+project_id+->: id of current project 
  # * *Returns* :
  #   - calls the new action if task.save is true, otherwise redirects to index page
  #
  def create
    @task = Project.find(params[:project_id]).tasks.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_tasks_path, notice: 'تم عمل المهمة بنجاح' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  ## 
  # get the new parameters and update the database
  # * *Args*    :
  #   -+project_id+->: id of current project
  #   -+id+->: id of task to be edited
  # * *Returns* :
  #   - if attributes are updated redirects to index page, otherwise renders edit form
  #
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to project_tasks_path, notice: 'تم تحديث المهمة' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  ## 
  # destroy the task with :id
  # * *Args*    :
  #   -+id+->: id of task 
  # * *Returns* :
  #   - redirects to index of tasks
  #
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_tasks_path }
      format.json { head :no_content }
    end
  end
  
  def invite 
    @task = Task.find(params[:id])
    
  end
  def invite_user
    
    @inv = Task.find(params[:id]).send_invitation(params[:email], params[:invitation_message], "taketask/#{params[:id]}/#{Reviewer.find_by_email(params[:email]).id}")
  
  end
  def makesure
    puts(params[:task_id] , params[:reviewer_id])
  end


  ##
  # Displays a task and its current steps to allow the designer to edit the steps.
  # * *Args*    :
  #   - +id+ ->: The id of the task for which the steps will be edited.
  # * *Returns*  :
  #   -The page this task is associated with, and the steps added to the task.
  #

  def edit_steps
    @project = Project.find(params[:project_id])
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
