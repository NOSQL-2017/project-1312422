require 'pry'
class SessionsController < ApplicationController
	before_action :authorize, except: [:new, :create]
	def new
		session[:return_to] ||= request.referer
	end

	def create
		binding.pry
		if params[:username] != nil
			@users = User.find_by(username: params[:username])
			if @users and @users.authenticate(params[:password])
				session[:current_user_id] = @users.id
				redirect_to "/"
			else
				render :new
			end
		else
			auth = request.env["omniauth.auth"]
			session[:omniauth] = auth.except('extra')
			user = User.sign_in_from_omniauth(auth)
			session[:current_user_id] = user.id
			redirect_to "/"
		end
	end

	def destroy
		session[:return_to] ||= request.referer
		session[:current_user_id] = nil
		session[:omniauth] = nil
		redirect_to "/"
	end
end