class JobOpening < ActiveRecord::Base
  belongs_to :company
  has_many :events
end
