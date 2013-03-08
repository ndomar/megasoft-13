class UserBlogsController < ApplicationController
	def show
		@user = User.find(params[:user_id])
		@user_blog = UserBlog.find(params[:id])
		@blogpost = Blogpost.new
		@blogposts = @user_blog.blogposts	
	end

	def create
		@user = User.find(session[:user_id])
		@user_blog = @user.user_blogs.create(params[:user_blog])
		redirect_to :controller => 'profile', :action => 'show', :id =>@user.id
	end

	def edit
		@user = User.find(params[:user_id])
		@user_blog = UserBlog.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@user_blog = UserBlog.find(params[:id])
		if @user_blog.update_attributes(params[:user_blog])
			redirect_to :controller => 'profile', :action => 'show', :id =>@user.id
			else
				render 'edit'
		end
	end
end
