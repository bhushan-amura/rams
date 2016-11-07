class Candidate::Link
include Mongoid::Document
  # concerns
	include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
	belongs_to :candidate

	validates :link_type, :presence => true, :length => { maximum: 50 }
	validates :url, :presence => true, :length => { maximum: 65535 }
end
