class UserBlogsController < ApplicationController
	def show
		@user_blog = User_blog.find(:id)
		@blogposts = @user_blog.blogposts
	end

	def create
	end

	def edit
	end

	def update
	end
end
