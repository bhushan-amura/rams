class Candidate::Qualification < Qualification

  self.table_name = 'qualifications'

  def self.default_scope
    #where all the qualifications metioned in candidates_qualifications
  end
end
