class Image < ActiveRecord::Base
  attr_accessor :cover
  after_save :save_cover_image, if: :cover
  def save_cover_image
    if cover.original_filename
        filename = cover.original_filename
  	else
        require 'open-uri'
        open('image.png', 'wb') do |file|
          file << open(cover_filename).read
        end
    end

  	folder = "public/image/#{id}/cover"

  	FileUtils::mkdir_p folder
  	f = File.open File.join(folder, filename), "wb"
  	f.write cover.read()
  	f.close

  	self.cover = nil
  	update cover_filename: filename
  end
end
