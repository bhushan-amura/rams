class Candidate::Link < ActiveRecord::Base

  # concerns
	include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
	belongs_to :candidate

  # validations
	validates :type, :presence => true, :length => { maximum: 50 }
	validates :url, :presence => true, :length => { maximum: 65535 }
end
