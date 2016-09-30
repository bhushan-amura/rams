class  Company::JobOpportunity < ActiveRecord::Base

  # concerns

  # callbacks
  belongs_to :company

  # relationships
  has_many :events, foreign_key: :company_job_opportunity_id, dependent: :destroy
  has_many :skill_assignments, as: :skillable, dependent: :destroy
  has_many :skills, through: :skill_assignments
  has_many :qualification_assignments, as: :qualifiable, dependent: :destroy
  has_many :qualifications, through: :qualification_assignments

  accepts_nested_attributes_for :qualifications, :allow_destroy => true
  accepts_nested_attributes_for :skills, :allow_destroy => true

  # validations
  validates :title, presence:true, length: { maximum: 255 }
  validates :shift, presence:true, length: { maximum: 255 }
  validates :description, presence:true, length: { maximum: 65535 }
  validates :number_of_positions, presence:true

  #constants
  STATUS = ["OPEN","CLOSED"]

  # def sorted_jobs(company)
  #   company.job_opportunities.all.order("updated_at DESC")
  # end

  # scope :sorted, lambda { order("created_at DESC") }

end
