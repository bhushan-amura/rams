class Location < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  belongs_to :locatable, polymorphic: true

  # validations
  validates :city, presence:true
  validates :street_name, presence:true
  validates :street_address, presence:true
  validates :building_name, presence:true
  validates :building_number, presence:true
  validates :zipcode, presence:true
  validates :state, presence:true
  validates :country, presence:true


end
