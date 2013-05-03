class StatisticsController < ApplicationController

  before_filter :authenticate_designer!
  before_filter :checkDesigner

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
    @chosencardsort
    @cardsorts = Project.find(params[:project_id]).cardsorts
    if params[:task] != nil
      @chosentasks[@chosentasks.length] = Task.find(params[:task][:id])
    end
    if params[:questionnaire] != nil
      @chosenquestionnaire = Questionnaire.find(params[:questionnaire][:id])
    end
    if params[:cardsort] != nil
      @chosencardsort = Cardsort.find(params[:cardsort][:id])
    end
    if params[:reviewer] != nil
      @reviewer = Reviewer.find(params[:reviewer][:id])
      @chosencardsort = Cardsort.find(params[:reviewer][:cardsort])
    end
    respond_to do |format|
      format.html 
      format.json { render json: @tasks }
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
end
