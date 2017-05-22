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
end