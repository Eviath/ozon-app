class Service < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
