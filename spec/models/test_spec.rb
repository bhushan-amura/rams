require 'rails_helper'

RSpec.describe Test, type: :model do
  it{
    should have_many(:test_scores)
  }
end
