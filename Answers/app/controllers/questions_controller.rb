class QuestionsController < ApplicationController
  def create
    @page = Page.find(params[:page_id])
    @question = @page.questions.build(params[:question])
    @question.save

    redirect_to @page
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to @question.page
  end
end