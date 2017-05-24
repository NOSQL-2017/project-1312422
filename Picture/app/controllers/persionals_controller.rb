class PersionalsController < ApplicationController
	before_action :authorize
	def personal_page
		@user = User.find_by(id: session[:current_user_id])
		@images = Image.where(user_id: session[:current_user_id]).paginate(:page => params[:page], :per_page => 8)
	end
end