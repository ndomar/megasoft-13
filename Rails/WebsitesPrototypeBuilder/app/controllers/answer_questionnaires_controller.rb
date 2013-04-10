class AnswerQuestionnairesController < ApplicationController
 	## 
 	# called to create a new question in the database
  # finds the selected page
  # * *Args* :
  # - +@qquestion+ -> the id of the question he's answering
  # - +@answer+ -> the answer the user wants to save
  # * *Returns* :
  # - page refreshed and question added to db
  #
  def create
    # finds the selected page
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  	@qquestion = @questionnaire.qquestions.find(params[:qquestion_id])
  	@answer =@qquestion.answers.build(params[:body], :presence => true)
    respond_to do |format|
    if @answer.save
      # if Succedeed notify the user, and redirect to the reviewing page
      format.html { redirect_to :controller => :questionnaire, :action => :show, :id => @questionnaire,:notice => 'Answer was successfully created.' }
  	else
      # if did not Succedeed notify the user, and refresh and give a notice
      format.html {redirect_to :controller => :questionnaire, :action => :answer_show, :id => @questionnaire,:notice => 'Answer was not successfully created.' }
    end
  end
end
