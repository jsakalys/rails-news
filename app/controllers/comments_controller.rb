class CommentsController < ApplicationController

	def new # renders new comment form
	end

	def create # creates a new comment in db
		if (params[:post_id]) then
		@current_user.comments.create({:body => form_params['body'], :post_id => params[:post_id]})
		redirect_to root_path
		elsif (params[:comment_id]) then
		c = Comment.find params[:comment_id]
		@current_user.comments << c.comments.create({:body => form_params['body'], :user => @current_user})
		redirect_to root_path
		end
	end

	def destroy	 # deletes comment from db
	end

	private

	def form_params
   		params.require(:comment).permit(:body)
    end

end
