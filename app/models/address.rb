require 'elasticsearch/model'
class Address < ApplicationRecord
  
  belongs_to :property
  geocoded_by :street
  after_validation :geocode
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  # def full_address
  #   street.compact.join(',')
  # end
end

