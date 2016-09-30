class Institute < ActiveRecord::Base

  # associations
  has_many :qualification_assignments, as: :qualifiable,dependent: :destroy
  has_many :qualifications, through: :qualification_assignments

end
