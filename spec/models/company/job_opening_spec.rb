require 'rails_helper'

RSpec.describe JobOpening, type: :model do
  it {
    should_have_many :events
  }
end
