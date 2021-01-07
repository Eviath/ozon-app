class Service::Tile < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
