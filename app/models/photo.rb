require 'securerandom'
class Photo < ActiveRecord::Base
  belongs_to :group

  def set_image(file)
    if !file.nil?
      name = SecureRandom.hex(16) + File.extname(file.original_filename)
      File.open("public/photos/#{name}", "wb") do |f|
        f.write(file.read)
      end
      self.filename = name
    end
  end
end
