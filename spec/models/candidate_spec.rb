require 'rails_helper'

RSpec.describe Candidate, type: :model do
	it { should have_many(:achievements) 
		should have_many(:experiences)
		should have_many(:links)
		should have_many(:projects)
		should have_many(:qualifications)
		should have_many(:references)
		should have_many(:skills)
	}
end
