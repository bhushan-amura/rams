class Admin < ActiveRecord::Base

  # concerns

  # callbacks

  # associations
  belongs_to :user

  # validations

  # instance methods
  

  # class methods
  def self.shortlist_candidates(job_opening)
    # TODO : Figure out a way to incorporate experience in this
    # Maybe precompute columns of experience, achievements, qualifications,etc. in candidate table in order to 
    # sort the results 
    job_qualifications = job_opening.qualifications

    candidates_with_required_qualifications = Candidate.joins(:qualifications).where(qualification_assignments:{qualification_id:job_qualifications}) 

    job_skills = job_opening.skills
    candidates_with_required_skills = Candidate.joins(:skills).where(skill_assignments:{skill_id:job_skills})


    # TODO :Figure out a way to do union
    candidates_ids = candidates_with_required_skills.pluck(:id) + candidates_with_required_qualifications.pluck(:id)
    
    Candidate.where(id:candidates_ids.uniq)
  end

end
