class CommentsController < ApplicationController
  # called to create a new item in the database
  def create
    # finds the selected page
  	@page = Page.find(params[:page_id])
    @comment = @page.comments.build(params[:comment])
    respond_to do |format|
    if @comment.save
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page,:notice => 'Comment was successfully created.' }
      #format.html { redirect_to(reviewer, :notice => 'Comment was successfully created.') }
  	else
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Comment could not be saved. Please fill in all fields' }
      #format.html { redirect_to(reviewer, :notice => 'Comment could not be saved. Please fill in all fields')}
      end
    end
  end

# called to delete an item from the database
def destroy
    # find the item
    @comment = Comment.find(params[:id])
    @page = Page.find(params[:page_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :controller => :pages, :action => :reviewer, :id => @page ,:notice => 'Comment was successfully deleted.' }
      #format.html { redirect_to(reviewer :notice => 'Comment was successfully deleted.') }
      format.js   { render :layout => false }
    end
  end
end