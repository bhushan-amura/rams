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
  has_many :skill_assignments, as: :skillable, dependent: :destroy
  has_many :skills, through: :skill_assignments
  has_many :reviews, dependent: :destroy

  has_many :candidate_qualification_assignments,dependent: :destroy
  has_many :qualification_assignments, through: :candidate_qualification_assignments
  has_many :qualifications, through: :qualification_assignments 
  has_many :institutes, through: :qualification_assignments, source: :qualifiable, source_type: "Institute"

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


  # instance methods
  def add_institute_with_qualification(institute,qualification)
    qa = QualificationAssignment.find_or_create_by(qualification_id:qualification.id,qualifiable_id:institute.id,qualifiable_type:institute.class.to_s)

    cqa =  CandidateQualificationAssignment.new(candidate_id:self.id,qualification_assignment_id:qa.id)

    self.candidate_qualification_assignments << cqa

  end

  def update_institute_with_qualification(institute,qualification,candidate_id,qa_id)
    qa = QualificationAssignment.find_or_create_by(qualification_id:qualification.id,qualifiable_id:institute.id,qualifiable_type:institute.class.to_s)

    cqa_id = CandidateQualificationAssignment.find_by(candidate_id:candidate_id,qualification_assignment_id: qa_id).id

    CandidateQualificationAssignment.update(cqa_id, qualification_assignment_id:qa.id)

  end

  def get_institutes_with_qualifications
    institutes_with_qualifications = []
    assignments = self.candidate_qualification_assignments.pluck(:qualification_assignment_id)
    assignments.each do |assignment|
      institute = Institute.joins('INNER JOIN qualification_assignments ON qualification_assignments.qualifiable_id = institutes.id AND qualification_assignments.qualifiable_type="Institute"').select('institutes.*').where('qualification_assignments.id = ?', assignment).first
      qualification =  Qualification.joins('INNER JOIN qualification_assignments ON qualification_assignments.qualification_id = qualifications.id').select('qualifications.*').where('qualification_assignments.id = ?',assignment).first
      institutes_with_qualifications << {institute: institute, qualification: qualification,qual_ass_id: assignment}
    end
    institutes_with_qualifications
  end
end
