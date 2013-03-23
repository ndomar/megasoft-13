class ProfileController < ApplicationController
	def index
	end
	def show
		if (session[:user_id])
		@current_user = User.find(session[:user_id])
		@user_blogs = @current_user.user_blogs
	else
		render text:"Error 401: access denied "
	end

	end
end
