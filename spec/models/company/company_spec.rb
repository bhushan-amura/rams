require 'rails_helper'

RSpec.describe Company, type: :model do
  it {
    should_have_many :job_openings
    should_have_many :locations
  }
  
end
