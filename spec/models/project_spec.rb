require 'rails_helper'

RSpec.describe Project, type: :model do
	it { should belong_to(:candidate) }
end
