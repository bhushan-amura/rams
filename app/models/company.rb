class Company < ActiveRecord::Base
  has_many :job_openings
  has_many :locations, as: :locatable
end
