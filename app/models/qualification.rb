class Qualification < ActiveRecord::Base
	belongs_to :candidate
	has_many :course_scores
end
