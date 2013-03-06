class ProfileController < ApplicationController
	def index
	end
	def show
		@current_user = User.find(session[:user_id])
	end
end
