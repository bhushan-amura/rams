class TestScore < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :test
end
