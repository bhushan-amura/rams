class Candidate < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
	has_many :achievements
	has_many :experiences
	has_many :links
	has_many :projects
	has_many :references
	has_many :test_scores
  has_one :location, as: :locatable
	# has_many :skills
	has_many :tests, through: :test_scores
  has_many :qualification_assignments, as: :qualifiable
  has_many :qualifications, through: :qualification_assignments
  has_many :skill_assignments, as: :skillable
  has_many :skills, through: :skill_assignments
  has_one :location, as: :locatable


  # validations
	validates :first_name, :format => REGEX_NAME_FORMAT,
			:presence => true, length: {maximum: 20}
	validates :last_name, :format => REGEX_NAME_FORMAT,
			:presence => true, length: {maximum: 20}
	validates :dob, :presence => true
	validates :gender, :presence => true, inclusion:{:in => ["M", "F", "T"]}
  validates :marital_status, :presence => true, inclusion:{:in => ["married", "unmarrired"]}
  validates :status, :presence => true
	validates :languages, length: { maximum: 65535 }
	validates :summary, length: { maximum: 65535 }
	validates :interests, length: { maximum: 65535 }


end
