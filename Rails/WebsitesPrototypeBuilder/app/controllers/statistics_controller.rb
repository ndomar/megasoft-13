class StatisticsController < ApplicationController
  ## 
  # passes the list of tasks that belongs to the project to the index view
  # * *Args*    :
  #   -+project_id+->: id of current project
  # * *Returns* :
  #   - list of tasks that belongs to project_id
  #
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
