require 'rails_helper'

RSpec.describe Skill, type: :model do
	it { should have_and_belong_to_many(:candidates) }
end
