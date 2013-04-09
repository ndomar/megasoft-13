#home page of the website
#actions for the homepage views
class HomeController < ApplicationController

	before_filter :authenticate_designer!

	def index
 		
	end
	
end
