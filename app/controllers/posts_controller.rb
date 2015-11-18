class PostsController < ApplicationController
	before_action :is_authenticated?, except: [:index]
	
	def index # shows a list of posts
		@posts = Post.all
		@margin = 0
	end

	def new # renders new post form
	end

	def create # creates a new post in db
		@current_user.post.create form_params
		redirect_to root_path
	end

	def destroy	
	end

	private

	def form_params
   		params.require(:post).permit(:title, :link)
    end

end
