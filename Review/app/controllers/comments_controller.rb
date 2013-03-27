class CommentsController < ApplicationController
  def create
  	@page = Page.find(params[:page_id])
  	@comment = @page.comments.build(params[:comment])
  	@comment.save

  	redirect_to @page
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to @comment.page
  end
end
