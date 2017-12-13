module PropertiesHelper
  def property_type_name(property_type_id)
     PropertyType.find_by(id: property_type_id).property_type
    
  end
end
