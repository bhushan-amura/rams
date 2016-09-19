require 'rails_helper'

RSpec.describe Qualification, type: :model do
	it { should belong_to(:candidate) 
	should have_many(:course_scores) }
end
