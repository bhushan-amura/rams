class Event < ActiveRecord::Base

  include ForbiddenValues

  has_one :location, as: :locatable

  validates :event_type, presence:true
  validates :date, presence:true
  validates :time, presence:true

  # after_create :send_email_to_candidates

end
