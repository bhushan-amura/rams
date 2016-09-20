require 'rails_helper'

RSpec.describe Experience, type: :model do
	it { should belong_to(:candidate) }
end
