class ProfileController < ApplicationController
	def index
	end
	def show
		@current_user = User.find(params[:id])
		@user_blogs = @current_user.user_blogs

	end
end
