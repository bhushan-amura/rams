class Qualification
include Mongoid::Document
  # concerns
	include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # relationships
	has_many :course_scores,class_name: 'Candidate::CourseScore'
  has_many :qualification_assignments


  # validations
	validates :course, :presence => true, :length => { maximum: 255 }
	validates :domain, :presence => true, :length => { maximum: 255 }

end
