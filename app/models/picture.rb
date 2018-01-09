class Picture < ApplicationRecord
	mount_uploader :file_name, PictureUploader
	
end
