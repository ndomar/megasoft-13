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
			redirect_to :controller => 'profile', :action => 'show', :id =>authorized_user.id
			#render "profile/show"
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:user_id] = nil
		flash[:notice] = "You are now logged out!"
		render("home/index")
	end

end