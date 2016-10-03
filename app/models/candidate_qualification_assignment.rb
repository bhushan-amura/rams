class CandidateQualificationAssignment < ActiveRecord::Base
  self.table_name = 'candidates_qualification_assignments'

  belongs_to :qualification_assignment
  belongs_to :candidate

end
