class AnswersController < ApplicationController

  #Creates a new answer to a certain question
  #
  #@param [none]
  #@return [none]
  def answer
    #finds the selected question
    @page = Page.find(params[:page_id])
    #finds the selected question
  	@question = Question.find(params[:question_id])
    #adds an answer to the question
  	@answer = @question.answers.build(params[:answer])
  	@answer.save

  	redirect_to @page
  end

  #Deletes an answer
  #
  #@param [none]
  #@return [none]
  def destroy
    #Finds the answer the reviewer wants to delete
  	@answer = Answer.find(params[:id])
  	@answer.destroy

  	redirect_to @answer.question
  end
end
