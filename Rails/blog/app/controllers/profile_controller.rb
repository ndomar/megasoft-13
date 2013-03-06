class ProfileController < ApplicationController
	def index
	end
	def show
		@current_user = User.find(params[:id])
	end
end
