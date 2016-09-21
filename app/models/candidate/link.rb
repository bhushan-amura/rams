class Candidate::Link < ActiveRecord::Base
	include DatabaseStorageFormat

  before_save :lower_fields
	belongs_to :candidate

	validates :link_type, :presence => true, :length => { maximum: 50 }
	validates :url, :presence => true, :length => { maximum: 65535 }

  validates_associated :candidate
end
