class Candidate::Reference < ActiveRecord::Base

  # concerns
	include ForbiddenValues
	include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
	belongs_to :candidate

  # validations
	validates :name, :presence => true, :length => { maximum: 20 }
	# validates :email, :presence => true, :length => { maximum: 100 },
	# 			:format => EMAIL_REGEX
	validates :contact,:length => { :minimum => 10, :maximum => 20 }
  validates_associated :candidate
	# validate :valid_email?
end
