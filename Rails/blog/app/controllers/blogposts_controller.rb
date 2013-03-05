class BlogpostsController < ApplicationController
	def index
		@blogposts = Blogpost.all
	end

	def new
		@blogpost = Blogpost.new
	end

	def create
		@blogpost = Blogpost.new(params[:blogpost])

		if @blogpost.save
			render :text => params[:blogpost].inspect
		else
			render 'new'
		end
	end

	def show
		@blogpost = Blogpost.find(params[:id])
	end
end
