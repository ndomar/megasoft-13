class QuestionnairesController < ApplicationController
  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionnaires }
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionnaire }
    end
  end
  # author ahmed jihad
  ## 
  # called to show answer view for questionnaires
  # finds the selected questionnaire
  # * *Args*    :
  # - +@questionnaire+ -> the id of the questionnaire he wants to answer
  # * *Returns* :
  # - doesnt return anything just renders the answer_show view
  #
  def answer_show
    @questionnaire = Questionnaire.find(params[:id])
    answer = @questionnaire.answer_questionnaires.build
    render 'answer_show'
  end

  # GET /questionnaires/new
  # GET /questionnaires/new.json
  def new
    @questionnaire = Questionnaire.new
      question = @questionnaire.qquestions.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionnaire }
    end
  end

  # GET /questionnaires/1/edit
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(params[:questionnaire])
    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render json: @questionnaire, status: :created, location: @questionnaire }
        format.js { render "redirect" }
      else
        format.html { render action: "new" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
        format.js {render "validation_error"}
      end
    end
  end

  # author ahmed jihad
  ## 
  # called to update questionnaire questions or answers
  # finds the selected questionnaire
  # * *Args*    :
  # - +@questionnaire+ -> the id of the questionnaire he wants to answer
  # * *Returns* :
  # - doesnt return anything just renders the questionnaire list
  #
  def update
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      if @questionnaire.update_attributes(params[:questionnaire])
        flash[:message] = "Questionnaire updated successfully"
        format.html { redirect_to :action=> :index, notice: 'Questionnaire was successfully updated.' }
        format.json { head :no_content }
        format.js { render "redirect" }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
        format.js {render "validation_error"}
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end
end

