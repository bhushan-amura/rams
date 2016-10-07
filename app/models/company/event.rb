class Company::Event < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  #scopes
  # scope :sorted_events, lambda { order("created_at ")}

  # callbacks
  before_save :lower_fields

  # TODO
  # after_create :send_email_to_candidates

  # associations
  belongs_to :job_opportunity
  has_one :location, as: :locatable
  accepts_nested_attributes_for :location

  # validations
  validates :event_type, presence:true, :format => REGEX_NAME_FORMAT, length: { :maximum => 255}
  validates :date_time, presence:true
  validates :duration, presence:true

end
