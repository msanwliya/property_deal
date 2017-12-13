class PropertyImage < ApplicationRecord
  belongs_to :property
  mount_uploader :image, ImageUploader
end
