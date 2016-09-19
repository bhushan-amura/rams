class Candidate < ActiveRecord::Base
	has_many :achievements
	has_many :experiences
	has_many :links
	has_many :projects
	# has_many :qualifications
	has_many :references
	has_and_belongs_to_many :skills
	has_and_belongs_to_many :qualifications
	# has_many :skills
end
