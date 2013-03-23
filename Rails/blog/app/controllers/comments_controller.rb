class CommentsController < ApplicationController
	def create
		@user = User.find(session[:user_id])
		@blogpost = Blogpost.find(params[:blogpost_id])
		@user_blog = UserBlog.find(params[:user_blog_id])
		#params[:comment]=[:user_id=>@user.id]
		@comment = @blogpost.comments.create(:user_id=>@user.id, :text => (params[:comment])[:text])
		redirect_to user_user_blog_blogpost_path(@user, @user_blog, @blogpost)
	end

	def edit
		@blogpost = Blogpost.find(params[:blogpost_id])
		@user = User.find(params[:user_id])
		@user_blog = UserBlog.find(params[:user_blog_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@blogpost = Blogpost.find(params[:blogpost_id])
		@user = User.find(params[:user_id])
		@user_blog = UserBlog.find(params[:user_blog_id])
		if @comment.update_attributes(params[:comment])
			redirect_to user_user_blog_blogpost_path(@user, @user_blog, @blogpost)
		else
			@blogpost = Blogpost.find(params[:blogpost_id])
			render edit_user_user_blog_blogpost_comment_path(@user, @user_blog, @blogpost, @comment)
		end
	end

	def show
		@comment = Comment.find(params[:id])
		@user = User.find(@comment.user_id)
	end
end
