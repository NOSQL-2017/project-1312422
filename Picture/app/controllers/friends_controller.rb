class FriendsController < ApplicationController
  def index
  	@user = User.find(session[:current_user_id])
  end

  def create
  	user = User.find(session[:current_user_id])
		@friends = user.friends.build(:friend_id => params[:friend_id])
    	@friends.save

    	user = User.find(params[:friend_id])
    	@inverse_friend = user.friends.build(:friend_id => session[:current_user_id])
    	@inverse_friend.save

		redirect_to :back
  end

  def destroy
  	user = User.find(session[:current_user_id])
		@friendship = user.friends.find_by_friend_id(params[:id])
  		@friendship.destroy

  		user = User.find(params[:id])
		@friendship = user.friends.find_by_friend_id(session[:current_user_id])
  		@friendship.destroy
  		
		redirect_to :back
  end
end
