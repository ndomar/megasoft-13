class CommentsController < ApplicationController
 
  # called to create a new item in the database
  def create
    # finds the selected page
  	@page = Page.find(params[:page_id])
    # create commet related to this page
  	@comment = @page.comments.build(params[:comment])
  	@comment.save

  	redirect_to @page
  end

  # called to delete an item from the database
  def destroy
    # find the item
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to @comment.page
  end
end
