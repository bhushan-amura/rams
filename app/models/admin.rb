class Admin < ActiveRecord::Base

  # concerns

  # callbacks

  # associations
  belongs_to :user

  # validations

  def shortlist_candidates(job_id)
    job_opening = Company::JobOpportunity.find(job_id)
    job_qualifications = job_opening.qualifications

    candidates_with_required_qualifications = Candidate.joins(:qualifications).where(qualification_assignments:{qualification_id:job_qualifications}) 

    job_skills = job_opening.skills
    candidates_with_required_skills = Candidate.joins(:skills).where(skill_assignments:{skill_id:job_skills})

    candidates_ids = candidates_with_required_skills.pluck(:id) + candidates_with_required_qualifications.pluck(:id)
    Candidate.where(id:candidates_ids.uniq)
  end

end
