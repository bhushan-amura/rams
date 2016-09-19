class Candidate < ActiveRecord::Base
	
	include ForbiddenValues

	has_many :achievements
	has_many :experiences
	has_many :links
	has_many :projects
	has_many :references
	has_and_belongs_to_many :skills
	has_and_belongs_to_many :qualifications
	has_many :test_scores
	has_many :tests, through: :test_scores 
		

	validates :first_name, :format => REGEX_NAME_FORMAT, 
			:presence => true, length: {maximum: 20}
	validates :last_name, :format => REGEX_NAME_FORMAT,
			:presence => true, length: {maximum: 20}
	validates :email, :presence => true, :length => { :maximum => 100 },
			 :format => EMAIL_REGEX, :confirmation => true, 
			 :uniqueness => true
	validate :email_is_allowed
	validates :gender, :presence => true, :in => ["M", "F", "T"]
	validates :marital_status, :presence => true, :in => ["married", "unmarrired"]
	validates :status, :presence => true, :in => ["seeker", "non-seeker"]
	validates :languages, length: { maximum: 65535 }
	validates :summary, length: { maximum: 65535 }
	validates :interests, length: { maximum: 65535 }
	

end	
