require 'rails_helper'

RSpec.describe Skill, type: :model do
	it { should belong_to(:candidate) }
end
