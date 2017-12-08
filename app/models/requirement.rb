class Requirement < ApplicationRecord
  belongs_to :property_type
  belongs_to :user
  def require_property 
    properties = Property.where("properties.location LIKE ?","%#{location}%")
     properties = Property.where("properties.property_type_id = ?",property_type_id)
      # properties = Property.where("properties.location LIKE ? OR properties.property_type_id = ?  OR properties.price <= ? OR properties.price <= ?", "%#{location}%",property_type_id , max,min) if (location.present? || property_type_id.present?)

  end
end
