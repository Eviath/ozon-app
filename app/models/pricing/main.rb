class Pricing::Main < ApplicationRecord
  mount_uploader :picture, PictureUploader
  enum position: { top: 0, car: 1, bus: 2 }
end
