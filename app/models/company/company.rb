class Company < ActiveRecord::Base
  include ForbiddenValues
  include DatabaseStorageFormat

  before_save :lower_fields

  has_many :job_openings
  has_many :locations, as: :locatable
  has_many :reviews

  validates :name, presence:true, length: { :maximum => 255 }
  validates :company_type, presence:true, length: { :maximum => 255 }
  validates :email, presence:true, :length => { :maximum => 100 },
    :format => EMAIL_REGEX, :confirmation => true,
    :uniqueness => true
  validates :description, presence:true
  validates :url, presence:true, length: { :maximum => 255 }

  validate :vaid_email?

end
