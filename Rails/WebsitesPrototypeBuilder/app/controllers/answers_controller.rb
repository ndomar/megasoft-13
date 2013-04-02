# class AnswersController < ApplicationController
# 	class CommentsController < ApplicationController
#   # called to create a new item in the database
#   def create
#     # finds the selected page
#   	@page = Page.find(params[:page_id])
#   	@question = @page.question.find([:question_id])
#     @answer = @page.question.answers.build(params[:answers])
#     respond_to do |format|
#     if @answers.save
#       format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page,:notice => 'Answer was successfully created.' }
#       #format.html { redirect_to(reviewer, :notice => 'Answer was successfully created.') }
#   	else
#       format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Answer could not be saved. Please fill in all fields' }
#       #format.html { redirect_to(reviewer, :notice => 'Answer could not be saved. Please fill in all fields')}
#       end
#     end
#   end

# # called to delete an item from the database
# def destroy
#     # find the item
#     @answer = Answer.find(params[:id])
#     @question = Question.find(params[:page_id])
#     @page = Page.find(params[:page_id])
#     @comment.destroy
#     respond_to do |format|
#       format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Comment was successfully deleted.' }
#       #format.html { redirect_to(reviewer :notice => 'Comment was successfully deleted.') }
#       format.js   { render :layout => false }
#     end
#   end
# end
# end
