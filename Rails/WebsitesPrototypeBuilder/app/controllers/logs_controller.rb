class LogsController < ApplicationController
  # def new 
  #   @log =Log.new
  # end
  def create
  end

  def new
    @task_result=TaskResult.find(session[:task_result_id])
    @task= Task.find(@task_result.task_id)  
    @log =Log.new
    @log.task_result_id= session[:task_result_id]
    @log.action=params[:change_action]
    @log.time=params[:change_action_time]
    @log.component_involved=params[:change_component_involved]
    @log.save
    if Time.parse(@task_result.time) <= Time.parse("0:"+@task.time_limit.to_s+":0")
      respond_to do |format|
        format.js { render :template => "tasks/task_reviewer_error" }
      end
    else
      render :nothing => true
    end
  end

  def update
    @log = Log.find(params[:id])
    @log.action=params[:change_action]
    @log.time=params[:change_action_time]
    @log.component_involved=params[:change_component_involved]
    @log.save

    render :nothing => true
  end
  
end
