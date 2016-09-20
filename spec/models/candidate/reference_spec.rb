require 'rails_helper'

RSpec.describe Reference, type: :model do
	it { should belong_to(:candidate) }
end
