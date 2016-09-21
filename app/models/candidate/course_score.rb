class Candidate::CourseScore < ActiveRecord::Base

  # concerns
  include DatabaseStorageFormat
  
  # callbacks
  before_save :lower_fields

  # associations
	belongs_to :qualification


  # validations
	validates :course, :presence => true, length: { maximum: 255 }
	validates :end_year, :presence => true
	validates :score, :presence => true, :numericality => {:greater_than => 0, :less_than => 100}
end
