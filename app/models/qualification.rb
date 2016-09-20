class Qualification < ActiveRecord::Base
	include DatabaseStorageFormat

  before_save :lower_fields
	
	has_and_belongs_to_many :candidates
	has_many :course_scores

	validates :course, :presence => true, :length => { maximum: 255 }
	validates :domain, :presence => true, :length => { maximum: 255 }

end

