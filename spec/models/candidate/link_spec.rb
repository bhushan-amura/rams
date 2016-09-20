require 'rails_helper'

RSpec.describe Link, type: :model do
	it { should belong_to(:candidate) }
end
