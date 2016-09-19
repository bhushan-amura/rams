class Test < ActiveRecord::Base
  has_many :test_scores
  validates :name, :presence => true, :length => { maximum: 20 }
  validates :url, :presence => true, :length => { maximum: 65535 }
end
