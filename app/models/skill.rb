class Skill < ActiveRecord::Base

  # concerns
	include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  has_many :skill_assignments

  # validations
  validates :name, presence:true
end
