class Location < ActiveRecord::Base

  include ForbiddenValues 

  belongs_to :locatable, polymorphic: true

  validates :city, presence:true
  validates :street_name, presence:true
  validates :street_address, presence:true
  validates :building_name, presence:true
  validates :building_number, presence:true
  validates :zipcode, presence:true
  validates :state, presence:true
  validates :country, presence:true

  
end
