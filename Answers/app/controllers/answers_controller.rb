class AnswersController < ApplicationController
  #Creates a new answer
  #
  #@param [none]
  #@return [none]
  def answer
  	@page = Page.find(params[:page_id])
  	@answer = @page.answers.build(params[:answer])
  	@answer.save

  	redirect_to @page
  end

  #Destroys an answer
  #
  #@param [none]
  #@return [none]
  def destroy
  	@answer = Answer.find(params[:id])
  	@answer.destroy

  	redirect_to @answer.page
  end
end
