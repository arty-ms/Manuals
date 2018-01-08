class Picture < ApplicationRecord
	mount_uploader :file_name, PictureUploader
	belongs_to :post
end
