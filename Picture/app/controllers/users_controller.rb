require 'app_api/client'
require 'pry'
class UsersController < ApplicationController
  def create
    client = ::BookStoreAPI::Client.new('hatu87@gmail.com', '12345678')
    client.login
    @books = client.books
  end

  def new
  	client = ::AppAPI::Client.new(params[:username], params[:password], params[:name], params[:avatar], params[:gender], params[:email] )
  	client.register
  end
end