require 'rails_helper'

RSpec.describe Skill, type: :model do
	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}
	let(:skill) {Skill.new(name:"C")}

	context "model with attributes valid?" do	
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    candidate.skills << skill
		    expect(candidate.skills.first).to be_valid
		 end
	end

	context "skill" do
		it "invalid! field required." do
			skill.name = ""
			expect(skill).to be_invalid
		end

		it "invalid! character limit 15 exceeded." do
			skill.name = "g"*16
			expect(skill).to be_invalid
		end
	end

end
