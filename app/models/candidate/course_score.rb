class CourseScore < ActiveRecord::Base
	belongs_to :qualification

	validates :course, :presence => true, length: { maximum: 255 }
	validates :end_year, :presence => true
	validates :score, :presence => true, :numericality => {:greater_than => 0, :less_than => 100}
end
