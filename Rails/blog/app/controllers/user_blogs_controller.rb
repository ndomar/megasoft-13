class UserBlogsController < ApplicationController
	def show
		@user_blog = UserBlog.find(params[:id])
		@blogposts1 = @user_blog.blogposts
	end

	def create
		@user = User.find(params[:user_id])
		@user_blog = @user.user_blogs.create(params[:user_blog])
		redirect_to :controller => 'profile', :action => 'show', :id =>@user.id
	end

	def edit
	end

	def update
	end
end
