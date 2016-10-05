require 'rails_helper'

RSpec.describe Qualification, type: :model do
	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

	let(:qualification) {Qualification.new(course:"BTech",domain:"IT")}

	let(:job_opportunity) {Company::JobOpportunity.new(title:"qq",shift:"q",description:"a",number_of_positions:12) }

	context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    # candidate.qualifications << qualification
		    expect(qualification).to be_valid
				expect(job_opportunity).to be_valid
				job_opportunity.qualifications << qualification
				expect(job_opportunity.qualifications.first).to be_valid
		 end
	end

	context "course" do
		it "invalid! field required." do
			qualification.course = ""
			expect(qualification).to be_invalid
		end

		it "invalid! character limit 255 exceeded." do
			qualification.course = "g"*256
			expect(qualification).to be_invalid
		end
	end

	context "domain" do
		it "invalid! field required." do
			qualification.domain = ""
			expect(qualification).to be_invalid
		end

		it "invalid! character limit 255 exceeded." do
			qualification.domain = "g"*256
			expect(qualification).to be_invalid
		end
	end
end
