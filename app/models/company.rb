class Company < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields

  # associations
  has_many :job_opportunities
  has_many :locations, as: :locatable
  has_many :reviews

  # validations
  validates :name, presence:true, length: { :maximum => 255 }
  validates :company_type, presence:true, length: { :maximum => 255 }
  validates :description, presence:true
  validates :url, presence:true, length: { :maximum => 255 }


end
