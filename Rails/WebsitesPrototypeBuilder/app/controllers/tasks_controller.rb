class TasksController < ApplicationController

  ## 
  #Method index gets all the tasks from the database
  #* *Args*
  #* *Returns*:
  #-all the tasks and their details as an html page
  #
  def index
    @tasks = Task.all
    @email
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
  #routes to the view invite which contins a form to share the task
  #* *Args*    :
  #   -+Task+->: an instance of the class task
  #* *Returns*    :
  #   - routes to view invite and renders it as an html form
  
#  def invite 
#   @task = Task.find(params[:id])    
#  end
  
  #is invoked when the user submites the form in the invite view
  #* *Args*    :
  #   -+Task+->: an instance of the class task
  #   -+messege+->: from the form in view invite of type string
  #   -+email+->: from the form in the view invite of type string
  #* *Returns*    :
  #   -
  def invite_user
    puts(params[:email])
    puts('bkbdvjkdbfjkvdbjhvkbsjkbvjkfsbvkjsfbvkjdsbcjkvdsbjvcscsda')
    @Reviewer = Reviewer.find_by_email(params[:email])
    if @Reviewer == nil
      @Reviewer = Reviewer.create(:email => params[:email])
      @Reviewer.save
    end
     
    @inv = Task.find(params[:id]).send_invitation(@Reviewer, params[:invitation_message],
     "http://localhost:3000/projects/#{params[:project_id]}/tasks/#{params[:task_id]}/reviewers/#{@Reviewer.id}") 
    respond_to do |format|
      format.js {render 'invite_user', :status => :ok}
    end
  end
end
