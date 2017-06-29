class Api::V1::SessionsController < Api::V1::APIController

  def create
    begin
      user = User.authenticate(auth_params)
      unless user.nil?
        render json: { token: user.token }, status: :ok
      else
        render json: { errors: 'Wrong username or password' }, status: :unauthorized
      end
    rescue ActionController::ParameterMissing
      render json: { errors: 'Required parameters are missing'}, status: :unprocessable_entity
    end

  end

  private
  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end