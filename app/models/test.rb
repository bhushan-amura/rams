class Test < ActiveRecord::Base

  # concern
  include DatabaseStorageFormat

  # callback
  before_save :lower_fields
  
  # associations
  has_many :test_scores, class_name: 'Candidate::TestScore'

  # validations
  validates :name, :presence => true, :length => { maximum: 20 }
  validates :url, :presence => true, :length => { maximum: 65535 }

end
