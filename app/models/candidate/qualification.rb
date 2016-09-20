class Qualification < ActiveRecord::Base
	has_and_belongs_to_many :candidates
	has_many :course_scores

	validates :course, :presence => true, :length => { maximum: 255 }
	validates :domain, :presence => true, :length => { maximum: 255 }
end
