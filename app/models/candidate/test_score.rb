class TestScore < ActiveRecord::Base
  include ForbiddenValues 
  
  belongs_to :candidate
  belongs_to :test

  validates :score, presence:true
  validate :valid_score?
end
