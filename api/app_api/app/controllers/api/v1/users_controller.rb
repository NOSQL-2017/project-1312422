class Api::V1::ArticlesController < ApplicationController
  def index
  	@users = User.all
  	render json: @users
  end
end
