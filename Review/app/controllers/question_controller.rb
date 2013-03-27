class QuestionController < ApplicationController

   def create
  	@page = Page.find(params[:page_id])
  	@question = @page.questions.build(params[:question])
  	@question.save

  	redirect_to @page
  end



end
