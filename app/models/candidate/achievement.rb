class Candidate::Achievement < ActiveRecord::Base
  
  include DatabaseStorageFormat
  
  	before_save :lower_fields

  	belongs_to :candidate

	validates :title, length: { maximum: 255 }, :presence => true
	validates :description, length: { maximum: 65535 }

  validates_associated :candidate
end

