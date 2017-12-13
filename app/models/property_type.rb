class PropertyType < ApplicationRecord
  has_many :properties, dependent: :destroy
  has_many :requirements, dependent: :destroy
end
