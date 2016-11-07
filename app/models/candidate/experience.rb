class Candidate::Experience
include Mongoid::Document
  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  belongs_to :candidate

  #validations
  validates :name, :format => REGEX_NAME_FORMAT, length: {maximum: 20},
        :presence => true
  validates :end_date, :presence => true
  validates :description, :length => {maximum: 65535}
  validates :shift_type, :presence => true

  # instance methods


  # class methods
  def self.in_days
    Candidate.joins(:experiences).select('SUM(DATEDIFF(candidate_experiences.end_date,candidate_experiences.start_date)) AS days,candidates.*').group(:candidate_id).order('1 DESC')
  end

end
