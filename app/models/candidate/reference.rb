class Candidate::Reference < ActiveRecord::Base
	include ForbiddenValues
	include DatabaseStorageFormat

  before_save :lower_fields

	belongs_to :candidate

	validates :name, :presence => true, :length => { maximum: 20 }
	# validates :email, :presence => true, :length => { maximum: 100 },
	# 			:format => EMAIL_REGEX
	validates :contact,  :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  validates_associated :candidate
	# validate :valid_email?
end
