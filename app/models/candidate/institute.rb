class Candidate::Institute < ActiveRecord::Base
  # associations
  has_and_belongs_to_many :candidates, join_table: 'candidate_institute_qualifications',foreign_key:'candidate_institute_id' 
  has_many :qualifications, through: :candidates
end
