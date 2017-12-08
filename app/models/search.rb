class Search < ApplicationRecord
  belongs_to :max_price, optional: true
  belongs_to :min_price,optional: true
  belongs_to :property_type,optional: true

  def search_property
  
    properties = Property.where("properties.location LIKE ? AND properties.property_type_id = ? ", "%#{location}%",property_type_id) if (location.present? &&  property_type_id.present?)
    properties = Property.where("properties.location LIKE ? ", "%#{location}%") if (location.present?)

  end
end
