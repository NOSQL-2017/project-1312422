require 'rest-client'
require 'pry'
module AppAPI
  class Client
    PICTURE_API_HOST = 'http://localhost:3001/api/v1'

    def initialize(username, password, name, avatar, gender, email)
      @username = username
      @name = name
      @avatar = avatar
      @gender = gender
      @email = email
      @password = password
    end

    # def books_path
    #   "#{PICTURE_API_HOST}/books"
    # end

    # def token_authorized?
    #   @access_token.present?
    # end

    def request(params)
      request_params = params
      if token_authorized?
        request_params = request_params.merge({ headers: { Authorization: "Token token=#{@access_token}" }})
      end
      RestClient::Request.execute(request_params)
    end

    def get(url, params={})
      request(method: :get, url: url, payload: params)
    end

    def post(url, params={})
      request(method: :post, url: url, payload: params)
    end

    # def login_path
    #   "#{PICTURE_API_HOST}/auth/login"
    # end

    def users_path
      "#{PICTURE_API_HOST}/users"
    end

    def register

      response = post users_path, { users: { username: @username, password: @password, name: @name, avatar: @avatar, gender: @gender, email: @email }}
      @access_token = JSON.parse(response.body)['token']
    end

    # def books
    #   response = get books_path

    #   if response.code == 200
    #     JSON.parse(response.body)
    #   else
    #     []
    #   end
    # end
  end
end
