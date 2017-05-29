class PagesController < ApplicationController
	def home
		@images = Image.joins("LEFT JOIN friends ON (friends.friend_id = images.user_id) Where ((friends.user_id = #{session[:current_user_id]}) OR (images.user_id = #{session[:current_user_id]})) AND images.status != 0").order('images.created_at desc').distinct.paginate(:page => params[:page], :per_page => 8)
	end

	def about
	end

	def contact
	end
end