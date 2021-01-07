class Information::Tile < ApplicationRecord
    mount_uploader :picture, PictureUploader
end
