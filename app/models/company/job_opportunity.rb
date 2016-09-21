class  Company::JobOpportunity < ActiveRecord::Base

  # concerns

  # callbacks
    belongs_to :company

  # relationships
    has_many :events
    has_many :skill_assignments, as: :skillable
    has_many :skills, through: :skill_assignments
    has_many :qualification_assignments, as: :qualifiable
    has_many :qualifications, through: :qualification_assignments

  # validations


end
