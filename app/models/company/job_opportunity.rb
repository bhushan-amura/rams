class  Company::JobOpportunity < ActiveRecord::Base
  belongs_to :company

  has_many :skill_assignments, as: :skillable
  has_many :skills, through: :skill_assignments

  has_many :qualification_assignments, as: :qualifiable
  has_many :qualifications, through: :qualification_assignments

end
