class ProjecttsController < ApplicationController

	def index()

		#@projectts = Projectt.all(:condition =>["designer = "])
		@designer= Designer.find(params[:designer_id]) #Getting the designer that logged in,check again
        @projectts = @designer.projectts.all() # Getting all the projects created by the logged in designer

	end


end
