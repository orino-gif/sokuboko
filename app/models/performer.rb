class Performer < ApplicationRecord
  mount_uploader :image, ImageUploader
end
