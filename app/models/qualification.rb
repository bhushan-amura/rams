class Qualification < ActiveRecord::Base
	has_and_belongs_to_many :candidates
	has_many :course_scores
end
