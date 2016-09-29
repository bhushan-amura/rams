class Location < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  belongs_to :locatable, polymorphic: true

  # validations
  validates :city, presence:true, length: { maximum:255 }
  validates :street_name, presence:true, length: { maximum:255 }
  validates :street_address, presence:true, length: { maximum:255 }
  validates :building_name, presence:true, length: { maximum:255 }
  # validates :building_number, presence:true
  validates :zipcode, presence:true, length: { maximum:255 }
  validates :state, presence:true, length: { maximum:255 }
  validates :country, presence:true, length: { maximum:255 }


end
