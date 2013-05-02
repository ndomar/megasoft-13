class HomeController < ApplicationController
	before_filter :authenticate_designer!

	def index	
	end

end
