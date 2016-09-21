class Qualification < ActiveRecord::Base
	include DatabaseStorageFormat

  before_save :lower_fields
	
	has_many :course_scores
  has_many :qualification_assignments, as: :qualifiable


	validates :course, :presence => true, :length => { maximum: 255 }
	validates :domain, :presence => true, :length => { maximum: 255 }

end

