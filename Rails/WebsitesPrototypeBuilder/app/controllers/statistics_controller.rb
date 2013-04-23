class StatisticsController < ApplicationController
  def index
    @tasks = Project.find(params[:project_id]).tasks
    @chosentasks = []
    if params[:taskid] != nil
      if params[:taskid][:current_task] != nil
        @chosentasks[@chosentasks.length] = Task.find(params[:taskid][:current_task])
      end
      @chosentasks[@chosentasks.length] = Task.find(params[:taskid][:task_id])
    end
    respond_to do |format|
      format.html 
      format.json { render json: @tasks }
    end
  end
end
