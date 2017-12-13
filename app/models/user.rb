class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [ :landlord, :renter ,:admin]
  has_many :properties, dependent: :destroy
  has_many :requirements, dependent: :destroy
end
