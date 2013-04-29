class QuestionsController < ApplicationController
  # called to create a new question in the database finds the selected page
  # * *Args* :
  #   -+@page+ -> the current page
  #   -+@question+ -> the question written in the notepaper
  # * *Returns* :
  #   -page refreshed and question added to db
  #
  def create
    # finds the selected page
  	@page = Page.find(params[:page_id])
    @question = @page.questions.build(params[:question])
    respond_to do |format|
    if @question.save
      # if Succedeed notify the user, and redirect to the reviewing page
      format.html { redirect_to :controller => :pages, :action => :designer, :id => @page,:notice => 'Question was successfully created.' }
  	else
      # if Succedeed notify the user, and redirect to the reviewing page
      format.html { redirect_to :controller => :pages, :action => :designer, :id => @page,:notice => 'Question could not be saved. Please fill in all fields' }
      end
    end
  end

  # called to delete a question from the database
  # * *Args* :
  # - +@page+ -> the current page
  # - +@question+ -> the question selected to be deleted
  # * *Returns* :
  # - AJAX used to delete answer (slides up and the question is removed from the db)
  #
  def destroy
    # find the item
    @question = Question.find(params[:id])
    @page = Page.find(params[:page_id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to :controller => :pages, :action => :designer, :id => @page,:notice => 'Question was successfully deleted.' }
      # Use AJAX for deletion
      format.js   { render :layout => false }
    end
  end
end
