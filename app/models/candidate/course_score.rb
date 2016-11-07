class Candidate::CourseScore
include Mongoid::Document
  # concerns
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
	belongs_to :qualification
  belongs_to :candidate


  # validations
	validates :end_year, :presence => true
	validates :score, :presence => true 
end
