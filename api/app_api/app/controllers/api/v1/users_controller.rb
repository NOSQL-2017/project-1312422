class Api::V1::UsersController < ApplicationController
  def index
  	@users = User.all
  	render json: @users
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	@user.token = SecureRandom.uuid.gsub(/\-/,'')
  	if @user.save
        render json: { token: user.token }, status: :ok
    else
        render json: { errors: 'Wrong email or password' }, status: :unauthorized
    end
  end

  private
  def user_params
      params.require(:user).permit(:username, :password, :name, :avatar, :gender, :email)
  end
end
