class Company < ActiveRecord::Base
  include ForbiddenValues

  has_many :job_openings
  has_many :locations, as: :locatable

  validates :name, presence:true
  validates :company_type, presence:true
  validates :email, presence:true, :length => { :maximum => 100 },
    :format => EMAIL_REGEX, :confirmation => true,
    :uniqueness => true
  validates :description, presence:true 
  validates :url, presence:true
  
  validate :email_is_allowed

end
