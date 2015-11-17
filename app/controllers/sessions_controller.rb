class SessionsController < ApplicationController
	before_action :is_authenticated?, only: [:destroy]
	def create
		user = User.authenticate user_params['email'], user_params['password']

		if user
			session[:user_id] = user.id
			flash[:success] = "You are logged in."
			redirect_to root_path
		else
			flash[:danger] = "Improper credentials."
			redirect_to login_path
		end
	end

	def new
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have been logged out."
		redirect_to root_path

	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end

end
