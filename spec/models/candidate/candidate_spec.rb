require 'rails_helper'

RSpec.describe Candidate, type: :model do
	it { 
    should have_many(:achievements) 
		should have_many(:experiences)
		should have_many(:links)
		should have_many(:projects)
		should have_and_belong_to_many(:qualifications)
		should have_many(:references)
		should have_and_belong_to_many(:skills)

	    should have_many(:test_scores)
	    should have_many(:tests)
	}
end
