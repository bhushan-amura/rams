class Candidate::Qualification < Qualification

  self.table_name = 'candidates_qualifications'

  def self.default_scope
    #where all the qualifications metioned in candidates_qualifications
  end
end
