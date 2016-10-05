class Company < ActiveRecord::Base

  # concerns
  include ForbiddenValues
  include DatabaseStorageFormat

  # callbacks
  before_save :lower_fields
  

  # associations
  has_many :job_opportunities, dependent: :destroy
  has_many :events, through: :job_opportunities
  has_one :location, as: :locatable, dependent: :destroy
  has_many :reviews, dependent: :destroy
  belongs_to :user

  # validations
  
  mount_uploader :logo, LogoUploader
  validates :name, presence:true, length: { :maximum => 255 }
  validates :company_type, presence:true, length: { :maximum => 255 }
  validates :description, presence:true
  validates :url, presence:true, length: { :maximum => 255 }

  def recent_events(event_count=5)
    self.events.order("created_at DESC").limit(event_count)
  end

end
