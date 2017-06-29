class Api::V1::APIController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  def current_user
    authenticate_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end

  def authenticate_user
     current_user || render_unauthorized
  end

  def render_unauthorized
    render json: { errors: 'Unauthorized Access' }, status: :unauthorized
  end
end
