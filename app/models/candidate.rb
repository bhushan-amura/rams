class Candidate < ActiveRecord::Base
	has_many :achievements
	has_many :experiences
	has_many :links
	has_many :projects
end
