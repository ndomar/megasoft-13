class CommentsController < ApplicationController
	def create
		@user = User.find(session[:user_id])
		@blogpost = Blogpost.find(params[:blogpost_id])
		#params[:comment]=[:user_id=>@user.id]
		@comment = @blogpost.comments.create(:user_id=>@user.id, :text => (params[:comment])[:text])
		render "/blogposts/show"
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

	def show
		@comment = Comment.find(params[:id])
		@user = User.find(@comment.user_id)
	end
end
