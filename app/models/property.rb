class Property < ApplicationRecord
  belongs_to :user
  belongs_to :property_type
  has_one :address,  dependent: :destroy
  accepts_nested_attributes_for :address

  
  def self.search(search)
    if search
      self.where("location like ?", "%#{search}%")
    else
      self.all
    end
  end
  
  


  
end
