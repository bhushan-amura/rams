class Candidate::Achievement
  # concerns
  include Mongoid::Document
  include DatabaseStorageFormat
  
  # callbacks  
  before_save :lower_fields

  # associations 
  belongs_to :candidate

  # validations
	validates :title, length: { maximum: 255 }
	validates :description, length: { maximum: 65535 }
end
