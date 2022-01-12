class Performer < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  mount_uploader :identification, ImageUploader
  mount_uploader :full_body, ImageUploader
  
end
