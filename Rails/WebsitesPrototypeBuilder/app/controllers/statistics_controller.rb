class StatisticsController < ApplicationController

  ## 
  # passes the list of tasks that belongs to the project to the index view
  # * *Args*    :
  #   -+project_id+->: id of current project
  #   -+chosentask+->: id of task to display statistics
  #   -+chosenquestionnaire+->: id of questionnaire to display results
  # * *Returns* :
  #   - list of tasks that belongs to project_id
  #   - the chosen task
  #   - the chosen questionnaire
  #
  def index
    @questionnaires = Project.find(params[:project_id]).questionnaires
    @tasks = Project.find(params[:project_id]).tasks
    @chosentasks = []
    @chosenquestionnaire
    if params[:task] != nil
      @chosentasks[@chosentasks.length] = Task.find(params[:task][:id])
    end
    if params[:questionnaire] != nil
      @chosenquestionnaire = Questionnaire.find(params[:questionnaire][:id])
    end
    respond_to do |format|
      format.html 
      format.json { render json: @tasks }
    end
  end
end
