class PropertyType < ApplicationRecord
  has_many :properties
  has_many :requirements
end
