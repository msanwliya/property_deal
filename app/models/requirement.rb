class Requirement < ApplicationRecord
  belongs_to :property_type
  belongs_to :user
   def ptype 
   @property_types = PropertyType.joins(:properties)
   property_type = @property_types.property.property_type
   property_type
   end

end
