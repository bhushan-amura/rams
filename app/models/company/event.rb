class Company::Event < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # TODO
  # after_create :send_email_to_candidates

  # associations
  has_one :location, as: :locatable

  # validations
  validates :event_type, presence:true
  validates :date, presence:true
  validates :time, presence:true

end
