require 'rails_helper'

RSpec.describe Candidate::Achievement, type: :model do
	let(:candidate) {
		Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")
	}

	let(:achievement) {Candidate::Achievement.new(title:"zest first prize",description:"dasddasd")}

	context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    candidate.achievements << achievement
		    expect(candidate.achievements.first).to be_valid
		end
	end

	context "title" do
		it "invalid! title can not be nil" do
		  achievement.title = ""
			expect(achievement).to be_valid
		end

		it "invalid! character limit 255 exceeded." do
			achievement.title = "g"*256
			expect(achievement).to_not be_valid
		end
	end

	context "description" do
		it "invalid! description can not be nil" do
		  achievement.description = ""
			expect(achievement).to be_valid
		end
		it "invalid! character limit 65535 exceeded." do
			achievement.description = "g"*65536
			expect(achievement).to be_invalid
		end
	end

	context "when Association" do
	  it "belongs to candidate" do
			assc = Candidate::Achievement.reflect_on_association(:candidate)
      expect(assc.macro).to eq :belongs_to
	  end
	end

end
