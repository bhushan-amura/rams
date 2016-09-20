class Skill < ActiveRecord::Base
	include DatabaseStorageFormat

  before_save :lower_fields

	has_and_belongs_to_many :candidates

  validates_associated :candidates
  validates :name, presence:true
end
