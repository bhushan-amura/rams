class Candidate::Project < ActiveRecord::Base

	include DatabaseStorageFormat

  before_save :lower_fields

	belongs_to :candidate

	validates :title, :length => { maximum: 50 }, :presence => true
	validates :domain, :length => { maximum: 50 }
	validates :end_date, :presence => true
	validates :position, :length => { maximum: 35 }, :presence => true
	validates :organisation, :length => { maximum: 35 }, :presence => true
	validates :information, :length => { maximum: 65535 }, :presence => true

  validates_associated :candidate
end
