module RequirementsHelper
def property_type_name(name)
  PropertyType.find_by(id: name).property_type
end
end