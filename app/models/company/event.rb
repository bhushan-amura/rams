class Company::Event < ActiveRecord::Base

  include ForbiddenValues
  include DatabaseStorageFormat

  before_save :lower_fields
  # after_create :send_email_to_candidates

  has_one :location, as: :locatable

  validates :event_type, presence:true
  validates :date, presence:true
  validates :time, presence:true

end
