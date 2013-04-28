class StatisticsController < ApplicationController
  ## 
  # passes the list of tasks that belongs to the project to the index view
  # * *Args*    :
  #   -+project_id+->: id of current project
  # * *Returns* :
  #   - list of tasks that belongs to project_id
  #
  def index
    @questionnaires = Project.find(params[:project_id]).questionnaires
    @tasks = Project.find(params[:project_id]).tasks
    @chosentasks = []
    @chosenquestionnaire
    if params[:taskid] != nil
      @chosentasks[@chosentasks.length] = Task.find(params[:taskid][:task_id])
    end
    if params[:questionnaire] != nil
      @chosenquestionnaire = Questionnaire.find(params[:questionnaire][:questionnaire_id])
      @qquestions = @chosenquestionnaire.qquestions
    end
    respond_to do |format|
      format.html 
      format.json { render json: @tasks }
    end
  end
end
