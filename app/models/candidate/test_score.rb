class Candidate::TestScore < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  belongs_to :candidate
  belongs_to :test

  # validations
  validates :score, presence:true
  validate :valid_score?
end
