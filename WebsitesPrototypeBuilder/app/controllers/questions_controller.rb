class QuestionsController < ApplicationController

  # called to create a new item in the database
  def create
    # finds the selected page
  	@page = Page.find(params[:page_id])
    @question = @page.questions.build(params[:question])
    respond_to do |format|
    if @question.save
      format.html { redirect_to ("/pages/designer"),:notice => 'Question was successfully created.' }
      #format.html { redirect_to(@page, :notice => 'Question was successfully created.') }
  	else
      format.html { redirect_to ("/pages/designer"),:notice => 'Question could not be saved. Please fill in all fields'}
      #format.html { redirect_to(@page, :notice => 'Question could not be saved. Please fill in all fields')}
      end
    end
  end

# called to delete an item from the database
def destroy
    # find the item
    @question = Question.find(params[:id])
    @page = Page.find(params[:page_id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to ("/pages/designer"),:notice => 'Question was successfully deleted.'}
      #format.html { redirect_to(@question.page, :notice => 'Question was successfully deleted.') }
      format.js   { render :layout => false }
    end
  end
end
