require 'rails_helper'

RSpec.describe Candidate::Reference, type: :model do
	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

	let(:reference) {Candidate::Reference.new(name:"jayesh",email:"jay@amura.com",contact:"9445678235")}

	context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    candidate.references << reference
		    expect(candidate.references.first).to be_valid
		 end
	end

	context "name" do
		it "invalid! field required." do
			reference.name = ""
			expect(reference).to_not be_valid
		end

		it "invalid! character limit 20 exceeded." do
			reference.name = [*('A'..'Z'),*('0'..'9')].sample(21).join
			expect(reference).to_not be_valid
		end
	end

	context "contact" do
		it "invalid! field required." do
			reference.contact = ""
			expect(reference).to_not be_valid
		end

		it "invalid! character limit between 10-20 only." do
      reference.contact = ([*('0'..'9'),*('0'..'9'),*('0'..'9')]).sample([9,21].sample).join
			expect(reference).to be_invalid
		end
	end

	context "when Association" do
	  it "belongs to candidate" do
			assc = Candidate::Reference.reflect_on_association(:candidate)
      expect(assc.macro).to eq :belongs_to
	  end
	end

end
