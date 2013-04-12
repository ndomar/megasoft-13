# encoding: utf-8
class TasksController < ApplicationController
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
end
