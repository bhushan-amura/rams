class TestScore < ActiveRecord::Base
  include ForbiddenValues
  include DatabaseStorageFormat

  before_save :lower_fields

  belongs_to :candidate
  belongs_to :test

  validates :score, presence:true

  validates_associated :candidate
  validates_associated :test
  validate :valid_score?
end
