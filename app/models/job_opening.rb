class JobOpening < ActiveRecord::Base

  include ForbiddenValues

  belongs_to :company
  has_many :events

  validates :title, presence:true
  validates :shift, presence:true
  validates :description, presence:true
  validates :number_of_positions, presence:true 

  # after_create : ask_for_candidates_from_agency

end
