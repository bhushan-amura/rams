class Test < ActiveRecord::Base
  has_many :test_scores
  validates :name, presence:true
  validates :url, presence:true
end
