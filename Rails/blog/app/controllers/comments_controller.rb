class CommentsController < ApplicationController
	def create
    @blogpost = Blogpost.find(params[:blogpost_id])
    @comment = @blogpost.comments.create(params[:comment])
    redirect_to blogpost_path(@blogpost)
  end


   def destroy
    @blogpost = Blogpost.find(params[:blogpost_id])
    @comment = @blogpost.comments.find(params[:id])
    @comment.destroy
    redirect_to blogpost_path(@blogpost)
  end


def edit
    @blogpost = Blogpost.find(params[:blogpost_id])
    @comment = Comment.find(params[:id])
  end


  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to :controller => "blogposts", :action => :show, :id => params[:blogpost_id]
    else
      @blogpost = Blogpost.find(params[:blogpost_id])
      render edit_blogpost_comment_path(@blogpost, @comment)
    end
  end
end
