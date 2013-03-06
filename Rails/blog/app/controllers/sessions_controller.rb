class SessionsController < ApplicationController

	before_filter :authenticate_user, :only => [:home, :profile, :setting]
	before_filter :save_login_state, :only => [:login, :login_attempt]
	
	def login
		#Login Form
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.email}"
			redirect_to(:action => 'index', :controlller => 'profile')
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
	end

end