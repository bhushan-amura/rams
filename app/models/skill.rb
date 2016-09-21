class Skill < ActiveRecord::Base

	include DatabaseStorageFormat

  before_save :lower_fields

  has_many :skill_assignments

  validates :name, presence:true
end
