class Test < ActiveRecord::Base
  include DatabaseStorageFormat

  before_save :lower_fields
  
  has_many :test_scores
  validates :name, :presence => true, :length => { maximum: 20 }
  validates :url, :presence => true, :length => { maximum: 65535 }

end
