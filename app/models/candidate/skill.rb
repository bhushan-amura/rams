class Candidate::Skill < ActiveRecord::Base
  self.table_name = 'skills'

  def self.default_scope
    #where all the skills metioned in candidate_skills
  end
end
