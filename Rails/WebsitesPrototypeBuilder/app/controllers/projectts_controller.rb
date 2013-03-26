class ProjecttsController < ApplicationController

	#def index()

		#@projectts = Projectt.all(:condition =>["designer = "])
	#	@designer= Designer.find(params[:designer_id]) #Getting the designer that logged in,check again
    #    @projectts = @designer.projectts.all() # Getting all the projects created by the logged in designer

	#end


	def new 
		@projectt = Projectt.new() #Creating a new project
	end

	def create
		@projectt = Projectt.new(params[:projectt]) #Creating a new project with the 
		if @projectt.save() #if the project.save method returns true which means that the project is created an saved successfully 
			redirect_to projectts_path #redirect to the Index PAGE, Design page
		else
			render "new"
		end
	end


end
