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
			redirect_to :action => :show, :id => @blogpost.id
		else
			render 'new'
		end
	end

	def show

		@blogpost = Blogpost.find(params[:id])
		@comment = Comment.new
	end

	def edit
		@blogpost = Blogpost.find(params[:id])
	end

	def update
		@blogpost = Blogpost.find(params[:id])
		if @blogpost.update_attributes(params[:blogpost])
			redirect_to :action => :show, :id => @blogpost.id
		else
			render 'edit'
		end
	end

	def destroy
		@blogpost = Blogpost.find(params[:id])
		@blogpost.destroy
		redirect_to :action => :index
	end

	def search
		query = params[:q]
		@blogposts = Blogpost.where("title LIKE ? or content LIKE ?",  '%' + params[:q] + '%',  '%' + params[:q] + '%')
	end

end
