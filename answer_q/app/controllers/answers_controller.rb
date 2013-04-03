class AnswersController < ApplicationController
  # called to create a new answer in the database
  def create
    # finds the selected page and question and fetches the answer
  	@page = Page.find(params[:page_id])
    @question = @page.questions.find(params[:question_id])
    @answer =@question.answers.build(params[:answer])
    respond_to do |format|
      if @answer.save
        format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page,:notice => 'Answer was successfully created.' }
  	   else
        format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Answer could not be saved. Please fill in all fields' }
      end
    end
  end

  # called to delete an answer from the database
  def destroy
    # find the answer id and the related question id and page id
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @page = Page.find(params[:page_id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Answer was successfully deleted.' }
      format.js   { render :layout => false }
    end
  end
end
