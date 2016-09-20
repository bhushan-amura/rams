class Skill < ActiveRecord::Base
	include DatabaseStorageFormat

  before_save :lower_fields

  has_many :skill_assignments, as: :skillable

  validates_associated :candidates
  validates :name, presence:true

end
