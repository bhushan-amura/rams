class Review < ActiveRecord::Base

  include DatabaseStorageFormat

  before_save :lower_fields
  
  belongs_to :candidate
  belongs_to :company

  validates :text, length:{maximum: 500}
  validates :rating,inclusion:{within:[1..5], message:"out of range"}
  
  validates_associated :candidate
  validates_associated :company 
end
