 # encoding: utf-8
class TasksController < ApplicationController

  before_filter :authenticate_designer!, :except => :task_reviewer
  before_filter :checkDesigner, :except => :task_reviewer

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
    if Project.all.last.id.to_f >= params[:project_id].to_f
      @project=Project.find(params[:project_id])
      @reviewer= Reviewer.find(params[:reviewer_id])

      if !@project.tasks.empty? && @project.tasks.last.id.to_f >= params[:task_id].to_f
        @task= @project.tasks.find(params[:task_id])
        @page= Page.find(1)
        #if @task.steps.nil? == 'false'
        @step=@task.steps.first
        @step_answer=@step.step_answers.new
        @step_answer.save
        #end
        @task_result=@task.task_results.new
        @task_result.reviewer_id=@reviewer.id
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
    @project = Project.find(params[:project_id])
    @pages = @project.pages
    @task = Task.new
    
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
    @task = Project.find(params[:project_id]).tasks.find(params[:id])

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
        @project = Project.find(params[:project_id])
        @pages = @project.pages
        format.html { redirect_to select_start_page_path(@project, @task), notice: 'تم عمل المهمة بنجاح' }
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
  # Disp
  # * *Args*    :
  #   - +project_id+ ->: The id of the project this task is associated with.
  #   - +id+ ->: The id of the task for which the steps will be edited.
  # * *Returns*  :
  #   -The page this task is associated with, and the steps added to the task.
  #

  def select_start_page
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @pages = @project.pages
  end

  ##
  # Displays a task and its current steps to allow the designer to edit the steps.
  # * *Args*    :
  #   - +project_id+ ->: The id of the project this task is associated with.
  #   - +id+ ->: The id of the task.
  #   - +page_id+ ->: The id of the page which should be the start page of the task.
  # * *Returns*  :
  #   -Saves the start page, and renders the edit steps view.
  #

  def save_start_page
    @task = Task.find(params[:id])
    @task.page_id = params[:page_id]
    @created = @task.save
    @project = Project.find(params[:project_id])
    @steps = @task.steps
    @page = Page.find(@task.page_id)
    #render :action => :edit_steps
    respond_to do |format|
      format.js{}
    end
  end


  ##
  # Displays a task and its current steps to allow the designer to edit the steps.
  # * *Args*    :
  #   - +project_id+ ->: The id of the project this task is associated with.
  #   - +id+ ->: The id of the task for which the steps will be edited.
  # * *Returns*  :
  #   -The view to edit the steps for this task, or an error page if the designer shouldn't be allowed to edit the steps.
  #

  def edit_steps
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
    @steps = @task.steps
    @page = @task.page
    @designer = current_designer
    @error = @task.allow_designer(@page, @designer, @project)

    respond_to do |format|
      if @error == 'start_page_not_defined'
        @pages = @project.pages
        format.html {render "select_start_page"}
      elsif @error == 'task_already_taken'
        format.html {render "error_page"}
      else
        format.html {render "edit_steps"}
      end
    end
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
    @step = Step.new(:task_id => params[:id], :page_id => params[:page_id],
     :event => params[:event], :component => params[:component], :description => params[:description])
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

  ##
  # Checks if the project belongs to the designer
  # * *Args*    :
  #   - +project_id+ ->: The id of the project
  #   - +current_designer+ ->: The designer currently logged in
  # * *Returns*  :
  #   -True if project belongs to designer and false otherwise
  #
  def checkDesigner()
    designer = Designer.find(current_designer.id)
    if(designer.id != Project.find(params[:project_id]).designer_id)
      render 'unauthorized'
      return true
    end
    return false
  end
  
  ##
  # Gets a certain task result from the database
  # * *Args*    :
  #   - +project_id+ ->: The id of the current project.
  #   - +task_id+ ->: The id of the current task.
  #   - +result_id+ ->: The id of the task result to be sent to 
  # * *Returns*  :
  #   -Renders an html view to view the log of the task reult
  #

  def log
    @task_result = Project.find_by_id(params[:project_id]).tasks.find(params[:task_id]).task_results.find_by_id(params[:result_id])
  end
end
