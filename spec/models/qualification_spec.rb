require 'rails_helper'

RSpec.describe Qualification, type: :model do
	it { 
	should have_and_belong_to_many(:candidates) 
	should have_many(:course_scores) }
end
