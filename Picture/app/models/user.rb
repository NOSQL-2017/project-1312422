class User < ApplicationRecord
  # has_secure_password
  attr_accessor :avatar
  has_many :friends
  has_many :friends_users, :through => :friends
  after_save :save_avatar_image, if: :avatar
  def save_avatar_image
    if avatar.original_filename
        filename = avatar.original_filename
  	else
        require 'open-uri'
        open('image.png', 'wb') do |file|
          file << open(avatar_filename).read
        end
    end

  	folder = "public/users/#{id}/avatar"

  	FileUtils::mkdir_p folder
  	f = File.open File.join(folder, filename), "wb"
  	f.write avatar.read()
  	f.close

  	self.avatar = nil
  	update avatar_filename: filename
  end

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      uid: auth['uid'],
      provider: auth['provider'],
      avatar_filename: auth['info']['image'],
      name: auth['info']['name'],
      email: auth['info']['email'],
      username: auth['extra']['raw_info']['screen_name'],
      name: auth['extra']['raw_info']['name']
    )
  end
end