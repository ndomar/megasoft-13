class LogsController < ApplicationController
  # def new 
  #   @log =Log.new
  # end
  def create
  end

  def new

    @log =Log.new
    @log.task_result_id= session[:task_result_id]
    @log.action=params[:change_action]
    @log.time=params[:change_action_time]
    @log.component_involved=params[:change_component_involved]
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
