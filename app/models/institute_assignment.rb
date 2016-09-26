class InstituteAssignment < ActiveRecord::Base
  self.table_name = 'candidate_institute_qualifications'
  belongs_to :candidate
  belongs_to :qualification
  belongs_to :institute
end
