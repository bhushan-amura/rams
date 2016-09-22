require 'rails_helper'

RSpec.describe Candidate::Project, type: :model do
	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

	let(:project) {Candidate::Project.new(title:"log analytics",domain:"Big DATA",end_date:Time.now,position:"intern",organisation:"BMC",description:"adkjjahsdkjh kjashdkj")}


	context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    candidate.projects << project
		    expect(candidate.projects.first).to be_valid
		 end
	end

	context "title" do
		it "invalid! field required." do
			project.title = ""
			expect(project).to be_invalid
		end

		it "invalid! character limit 50 exceeded." do
			project.title = "g"*51
			expect(project).to be_invalid
		end
	end

	context "domain" do
		it "invalid! character limit 50 exceeded." do
			project.domain = "g"*51
			expect(project).to be_invalid
		end
	end

	context "end date" do
		it "invalid! field required." do
			project.end_date = ""
			expect(project).to be_invalid
		end
	end

	context "position" do
		it "invalid! field required." do
			project.position = ""
			expect(project).to be_invalid
		end

		it "invalid! character limit 35 exceeded." do
			project.position = "g"*36
			expect(project).to be_invalid
		end
	end

	context "organisation" do
		it "invalid! field required." do
			project.organisation = ""
			expect(project).to be_invalid
		end

		it "invalid! character limit 35 exceeded." do
			project.organisation = "g"*36
			expect(project).to be_invalid
		end
	end


	context "description" do
		it "invalid! field required." do
			project.description = ""
			expect(project).to be_invalid
		end

		it "invalid! character limit 65535 exceeded." do
			project.description = "g"*65536
			expect(project).to be_invalid
		end
	end
end
