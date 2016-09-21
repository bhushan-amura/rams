class  Company::JobOpportunity < ActiveRecord::Base
  belongs_to :company
  has_one :event
end
