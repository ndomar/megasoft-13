class AnswersController < ApplicationController
  ## 
  #called to create a new answer in the database
  #finds the selected page and question and fetches the answer
  # * *Args*    :
  #   - +@page+ -> page ID that the question exists in
  #   - +@question+ -> question ID of the answering question
  #   - +@answer+ ->  answer that the user provides
  # * *Returns* :
  #   - page refreshed and answer added to db
  #
  def create

  	@page = Page.find(params[:page_id])
    @question = @page.questions.find(params[:question_id])
    @answer =@question.answers.build(params[:answer], :presence => true)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page,:notice => 'Answer was successfully created.' }
  	   else
        format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Answer could not be saved.' }
      end
    end
  end

  ## 
  #called to delete an answer from the database
  # * *Args*    :
  #   - +@page+ -> the current page
  #   - +@question+ -> question the reviewer wants to delete its answer
  #   - +@answer+ ->  answer ID
  # * *Returns* :
  #   - AJAX used to delete answer (slides up and answer removed)
  #
  def destroy
    # find the answer id and the related question id and page id
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @page = Page.find(params[:page_id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Answer was successfully deleted.' }
      # Use AJAX for deletion
      format.js   { render :layout => false }
    end
  end
end
