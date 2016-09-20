require 'rails_helper'

RSpec.describe Event, type: :model do
  it {
    should_have_one :location
  }
end
