class Property < ApplicationRecord
  belongs_to :user
  belongs_to :property_type
  has_one :address,  dependent: :destroy
  accepts_nested_attributes_for :address

  def self.search(search)
    if search
      self.joins(:address).where('addresses.street like ?', "%#{search}%")
    else
      self.all
    end
  end

  def self.unapprove 
    self.where(approve: false)
  end
  # debugger
  # def self.search(query)
  #   __elasticsearch__.search(
  #     {
  #       query: {
  #         multi_match: {
  #           query: query,
  #           fields: ['location']
  #         }
  #       }
  #     }
  #   )
  # end
end
