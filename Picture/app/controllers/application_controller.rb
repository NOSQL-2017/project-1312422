class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
		@users ||= User.find(session[:current_user_id]) if session[:current_user_id]
	end

	def authorize
		unless current_user
			redirect_to '/login'
		end
	end
end