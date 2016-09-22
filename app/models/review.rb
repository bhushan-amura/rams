class Review < ActiveRecord::Base

  # concern
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  belongs_to :candidate
  belongs_to :company

  # validations
  validates :text, length:{maximum: 500}
  validates :rating,inclusion:{in:[*1..5], message:"out of range"}
end
