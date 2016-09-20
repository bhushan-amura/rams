class Company::JobOpportunity < ActiveRecord::Base

  include ForbiddenValues
  include DatabaseStorageFormat

  before_save :lower_fields
  # after_create : ask_for_candidates_from_agency

  belongs_to :company
  has_many :events

  has_and_belongs_to_many :qualifications
  has_and_belongs_to_many :skills

  validates :title, presence:true
  validates :shift, presence:true
  validates :description, presence:true
  validates :number_of_positions, presence:true
  
  validates_associated :company

end
