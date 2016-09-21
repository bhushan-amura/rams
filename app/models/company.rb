class Company < ActiveRecord::Base
  include ForbiddenValues
  include DatabaseStorageFormat

  before_save :lower_fields

  has_many :job_opportunities
  has_many :locations, as: :locatable
  has_many :reviews
  validates :name, presence:true, length: { :maximum => 255 }
  validates :company_type, presence:true, length: { :maximum => 255 }
  validates :description, presence:true
  validates :url, presence:true, length: { :maximum => 255 }


end
