class CandidatesJobOpportunity
include Mongoid::Document
  self.table_name = "candidates_job_opportunities"
  enum status: [:selected,:mailed,:applied]

  belongs_to :candidate
  belongs_to :job_opportunity,class_name: 'Company::JobOpportunity'
end
