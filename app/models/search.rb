class Search < ApplicationRecord
  belongs_to :max_price
  belongs_to :min_price
  belongs_to :property_type

  def seach_property
    properties = Property.all
    properties = properties.where("location like ?", "%#{location}%") if location.present?
   # properties.
  end
end
