#home page of the website
#actions for the homepage views
class HomeController < ApplicationController

#if the user is signed in he is redirected to dashboard controller index action 
	def main
 		if designer_signed_in?
    redirect_to :controller=>'dashboard', :action => 'index'
 		end
	end
end
