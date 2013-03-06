class CommentsController < ApplicationController
	def create
		@blogpost = Blogpost.find(params[:blogpost_id])
		@comment = @blogpost.comments.create(params[:comment])
		render "/blogposts/show"
	end
end
