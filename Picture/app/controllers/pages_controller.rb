require'pry'
class PagesController < ApplicationController
	def home
		binding.pry
		@images = Image.joins("INNER JOIN friends ON (friends.friend_id = images.user_id AND friends.user_id = #{session[:current_user_id]}) OR (images.user_id = #{session[:current_user_id]})").order('images.created_at desc').distinct.paginate(:page => params[:page], :per_page => 8)
	end

	def about
	end

	def contact
	end
end