require 'rails_helper'

RSpec.describe Candidate::Experience, type: :model do

	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

	let(:experience) {Candidate::Experience.new(name:"jay",end_date:Time.now,description:"dkald",shift_type:"intern")}


	context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    candidate.experiences << experience
		    expect(candidate.experiences.first).to be_valid
		end
	end

	context "name" do
		it "invalid! field required." do
			experience.name = ""
			expect(experience).to be_invalid
		end

		it "invalid! character limit 20 exceeded." do
			experience.name = [*('A'..'Z'),*('0'..'9')].sample(21).join
			expect(experience).to_not be_valid
		end
	end

	context "end_date" do
		it "invalid! field required." do
			experience.end_date = ""
			expect(experience).to be_invalid
		end
	end

	context "description" do
		it "invalid! character limit 65535 exceeded." do
			experience.description = "a"*65536
			expect(experience).to be_invalid
		end
	end

	context "shift_type"  do
		it "invalid! field required." do
			experience.shift_type = ""
			expect(experience).to be_invalid
		end
	end

	context "when Association" do
	  it "belongs to candidate" do
			assc = Candidate::Experience.reflect_on_association(:candidate)
      expect(assc.macro).to eq :belongs_to
	  end
	end
end
