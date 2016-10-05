class  Company::JobOpportunity < ActiveRecord::Base

  # concerns

  # callbacks
  belongs_to :company



  # relationships

  has_many :events, foreign_key: :company_job_opportunity_id, dependent: :destroy
  has_many :skill_assignments, as: :skillable, dependent: :destroy
  has_many :skills, through: :skill_assignments
  has_many :qualification_assignments, as: :qualifiable, dependent: :destroy
  has_many :qualifications, through: :qualification_assignments
  has_and_belongs_to_many :candidates, join_table:'candidates_job_opportunities'

  accepts_nested_attributes_for :qualifications, :allow_destroy => true
  accepts_nested_attributes_for :skills, :allow_destroy => true

  # validations
  validates :title, presence:true, length: { maximum: 255 }
  validates :shift, presence:true, length: { maximum: 255 }
  validates :description, presence:true, length: { maximum: 65535 }
  validates :number_of_positions, presence:true, numericality: { :greater_than => 0 }

  #constants
  STATUS = ["OPEN","CLOSED"]

  #instance method
  def shortlist_candidates
    # TODO : Figure out a way to incorporate experience in this
    # Maybe precompute columns of experience, achievements, qualifications,etc. in candidate table in order to
    # sort the results
    job_qualifications = self.qualifications || Qualification.all
    job_skills = self.skills || Skill.all
    #job_experience = self.experience

    candidates_with_required_qualifications = Candidate.joins(:qualifications).where(qualification_assignments:{qualification_id:job_qualifications})

    candidates_with_required_skills =  Candidate.joins(:skills).where(skill_assignments:{skill_id:job_skills})
    candidates_ids = candidates_with_required_skills.pluck(:id) + candidates_with_required_qualifications.pluck(:id)

    candidate_shortlist_1 = Candidate.where(id:candidates_ids.uniq).where.not(id:self.candidates.pluck(:id))
    Candidate::Experience.in_days.where(id:candidate_shortlist_1)
  end

  # class methods/scope
  def self.get_recent_jobs(job_count=5)
    Company.joins(:job_opportunities).select('companies.name','company_job_opportunities.title','company_job_opportunities.id','company_job_opportunities.created_at').distinct.order(:created_at).limit(job_count)
  end

end
