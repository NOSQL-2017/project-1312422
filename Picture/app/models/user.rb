class User < ApplicationRecord
  has_secure_password
  attr_accessor :avatar

  after_save :save_avatar_image, if: :avatar
  def save_avatar_image
  	filename = avatar.original_filename
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
      avatar: auth['info']['image'],
      name: auth['info']['name'],
      email: auth['info']['email'],
      username: auth['extra']['raw_info']['username']
    )
  end
end