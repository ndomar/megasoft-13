class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
	def authenticate_user
		unless session[:user_id]
			redirect_to(:controller => 'sessions', :action => 'login')
			return false
		else
			# set current user object to @current_user object variable
			@current_user = User.find session[:user_id]
			return true
		end
	end

	def save_login_state
		if session[:user_id]
			redirect_to(:controller => 'profile', :action => 'show')
			return false
		else
			return true
		end
	end

end
