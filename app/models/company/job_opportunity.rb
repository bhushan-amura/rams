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
  
  has_many :candidates_job_opportunities
  has_many :candidates, through: :candidates_job_opportunities

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

    job_qualifications = self.qualifications.empty? ? Qualification.all : self.qualifications
    job_skills = self.skills.empty? ? Skill.all : self.skills

    candidates_with_required_qualifications = Candidate.joins(:qualifications).where("qualifications.id":job_qualifications).select("count(qualifications.id) as qualification_count, candidates.*").group(:id).order("1 DESC")


    candidates_with_required_qualifications =  candidates_with_required_qualifications.where.not(id:self.candidates)

    candidates_with_required_qualifications.map {|x| x.qual_cnt = x.qualification_count; x.skill_cnt = 0}


    candidates_with_required_skills = Candidate.joins(:skills).where("skills.id":job_skills).select("count(skills.id) as skill_count, candidates.*").group(:id).order("1 DESC")

    candidates_with_required_skills =  candidates_with_required_skills.where.not(id:self.candidates)

    candidates_with_required_skills.map {|x| x.qual_cnt = 0; x.skill_cnt = x.skill_count}

    qual_ids = candidates_with_required_qualifications.pluck(:id)
    skill_ids = candidates_with_required_skills.pluck(:id)

    common_ids = qual_ids & skill_ids
    uncommon_ids_qual = qual_ids - common_ids
    uncommon_ids_skill = skill_ids - common_ids
    shortlist = []

    common_ids.each do |x|
      cand_qual = candidates_with_required_qualifications.select{|c| c.id  ==  x}[0]
      cand_skill = candidates_with_required_skills.select{|c| c.id == x}[0]
      cand_qual.skill_cnt = cand_skill.skill_cnt
      shortlist << cand_qual
    end

    uncommon_ids_qual.each do |x|
      shortlist << candidates_with_required_qualifications.select{|c| c.id == x}[0]
    end

    uncommon_ids_skill.each do |x|
      shortlist << candidates_with_required_skills.select{|c| c.id == x}[0]
    end


    shortlist
  end

  def get_candidates_as_users
    User.where(id:self.candidates.pluck(:user_id))
  end
  
  def get_candidates_with_status
    self.candidates_job_opportunities.joins(:candidate).select("candidates.*,candidates_job_opportunities.*")
  end

  # class methods/scope
  def self.get_recent_jobs(job_count=5)
    Company.joins(:job_opportunities).select('companies.name','company_job_opportunities.title','company_job_opportunities.id','company_job_opportunities.created_at').distinct.order(:created_at).limit(job_count)
  end

end
