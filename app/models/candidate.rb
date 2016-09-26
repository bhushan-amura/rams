class Candidate < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  # TODO : Consider adding a count field in candidate table for achievement,experiences,links,....,etc.
  # in order to give better matches for job opportunity 
  has_many :achievements, dependent: :destroy
	has_many :experiences, dependent: :destroy
	has_many :links, dependent: :destroy
	has_many :projects, dependent: :destroy
	has_many :references, dependent: :destroy
	has_many :test_scores, dependent: :destroy
  has_many :course_scores, dependent: :destroy
  has_one :location, as: :locatable, dependent: :destroy
	has_many :tests, through: :test_scores
  has_many :qualification_assignments, as: :qualifiable, dependent: :destroy
  has_many :qualifications, through: :qualification_assignments
  has_many :skill_assignments, as: :skillable, dependent: :destroy
  has_many :skills, through: :skill_assignments
  has_many :reviews, dependent: :destroy
  belongs_to :user


  # validations
	#validates :first_name, :format => REGEX_NAME_FORMAT,
			#:presence => true
	#validates :last_name, :format => REGEX_NAME_FORMAT,
      #:presence => true
	validates :dob, :presence => true
	validates :gender, :presence => true, inclusion:{:in => ["M", "F", "T"]}
  validates :marital_status, :presence => true, inclusion:{:in => ["married", "unmarried"]}
	validates :languages, length: { maximum: 65535 }
	validates :summary, length: { maximum: 65535 }
	validates :interests, length: { maximum: 65535 }

  # constants
  GENDER = [["M","M"], ["F","F"], ["T","T"]]
  MARITAL = ["married", "unmarried"]
end
