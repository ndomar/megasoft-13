class BlogpostsController < ApplicationController
	def index
		@blogposts = Blogpost.all
	end

	def new
		@blogpost = Blogpost.new
	end

	def create
		@user_blog = UserBlog.find(params[:user_blog_id])
		@blogpost = @user_blog.blogposts.create(params[:blogpost])

		if @blogpost.save
			redirect_to 'users/:user_id/user_blogs/:user_blog_id/blogposts', :user_blog_id => @user_blog.id, :id => @blogpost.id , :user_id => session[:user_id]
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:user_id])
		@user_blog = UserBlog.find(params[:user_blog_id])
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
