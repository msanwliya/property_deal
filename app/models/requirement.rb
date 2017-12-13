class Requirement < ApplicationRecord
  belongs_to :property_type
  belongs_to :user

  def require_property 
    properties = Property.joins(:address).where('addresses.street like ?', "%#{location}%")if location.present? 
    properties = Property.where("properties.property_type_id = ?",property_type_id) if property_type_id.present?
    properties = Property.joins(:address).where('addresses.street like ? AND properties.property_type_id = ?', "%#{location}%",property_type_id)if (location.present? && property_type_id.present?)
    # properties = Property.where("properties.location LIKE ? OR properties.property_type_id = ?  OR properties.price <= ? OR properties.price <= ?", "%#{location}%",property_type_id , max,min) if (location.present? || property_type_id.present?)

  end
end
