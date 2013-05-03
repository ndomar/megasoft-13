class LogsController < ApplicationController
  # def new 
  #   @log =Log.new
  # end
  def create
  end

## 
#Author:Sarah
#Creates a new instance of the log
# * *Args*    :
#   -+@task+ -> the current task
#   -+@log+ -> the new instance of the log
# * *Returns*    :
# - nothing
#
  def new
    @task_result=TaskResult.find(session[:task_result_id])
    @task= Task.find(@task_result.task_id)  
    @log =Log.new
    @log.task_result_id= session[:task_result_id]
    @log.action=params[:change_action]
    @log.time=params[:change_action_time]
    @log.component_involved=params[:change_component_involved]
    @log.element_id=params[:change_element_id]
    @log.save
    render :nothing => true
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
