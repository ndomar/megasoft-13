class ProfileController < ApplicationController
	def index
	end
	def show
		@current_user = User.find(session[:user_id])
		@user_blogs = @current_user.user_blogs

	end
end
