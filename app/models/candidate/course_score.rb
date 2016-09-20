class Candidate::CourseScore < ActiveRecord::Base

  include DatabaseStorageFormat
  
  before_save :lower_fields

	belongs_to :qualification

	validates :course, :presence => true, length: { maximum: 255 }
	validates :end_year, :presence => true
	validates :score, :presence => true, :numericality => {:greater_than => 0, :less_than => 100}

  validates_associated :qualification
end
