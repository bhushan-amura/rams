require 'rails_helper'

RSpec.describe Candidate, type: :model do

	let(:candidate) {Candidate.new(first_name:"abcd", last_name:"efgh", dob:'1992/03/15', gender:'M', marital_status:"married", status:true, languages:"HIBRU", summary:"dont know", phone:"12321442415", interests:"dddd")}

	let(:institute) { Institute.new(university:'sppu', campus:'pict')}


	let(:qualification) {Qualification.new(course:"engineering", domain: "comp")}

	context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		end
	end

=begin
	context "first_name" do
		it "invalid! field required." do
			candidate.first_name = ""
			expect(candidate).to_not be_valid
		end

		it "invalid! character limit 20 exceeded." do
			candidate.first_name = [*('A'..'Z'),*('0'..'9')].sample(21).join
			expect(candidate).to_not be_valid
		end
	end

	context "last_name" do
		it "invalid! field required." do
			candidate.last_name = ""
			expect(candidate).to_not be_valid
		end
		it "invalid! character limit 20 exceeded." do
			candidate.last_name = [*('A'..'Z'),*('0'..'9')].sample(21).join
			expect(candidate).to_not be_valid
		end
	end

=end
	context "date of birth" do
		it "invalid! field required." do
			candidate.dob = ""
			expect(candidate).to_not be_valid
		end
	end

	context "gender" do
		it "invalid! field required." do
			candidate.gender = ""
			expect(candidate).to_not be_valid
		end

		it "invalid! values must be either M, F or T." do
			candidate.gender = ([*('A'..'Z'),*('0'..'9')]-%w(M F T)).sample(1).join
			expect(candidate).to_not be_valid
		end
	end

	context "marital status" do
		it "invalid! field required." do
			candidate.marital_status = ""
			expect(candidate).to_not be_valid
		end

		it "invalid! values must be either married or unmarried." do
			candidate.marital_status = ([*('A'..'Z'),*('0'..'9')]-%w(married unmarried)).sample([7,9].sample).join
			expect(candidate).to_not be_valid
		end
	end

	context "languages" do
		it "invalid! character limit 65535 exceeded." do
			candidate.languages = "g"*65536
			expect(candidate).to_not be_valid
		end
	end

	context "summary" do
		it "invalid! character limit 65535 exceeded." do
			candidate.summary = "g"*65536
			expect(candidate).to_not be_valid
		end
	end

	context "interests" do
		it "invalid! character limit 65535 exceeded." do
			candidate.interests = "g"*65536
			expect(candidate).to_not be_valid
		end
	end

	describe "when Association" do
		it "has many achivements" do
			assc = Candidate.reflect_on_association(:achievements)
	    expect(assc.macro).to eq :has_many
		end

		it "has many experiences" do
			assc = Candidate.reflect_on_association(:experiences)
	    expect(assc.macro).to eq :has_many
		end

		it "has many links" do
			assc = Candidate.reflect_on_association(:links)
	    expect(assc.macro).to eq :has_many
		end

		it "has many projects" do
			assc = Candidate.reflect_on_association(:projects)
	    expect(assc.macro).to eq :has_many
		end

		it "has many references" do
			assc = Candidate.reflect_on_association(:references)
	    expect(assc.macro).to eq :has_many
		end

		it "has many test_scores" do
			assc = Candidate.reflect_on_association(:test_scores)
	    expect(assc.macro).to eq :has_many
		end

		it "has many course_scores" do
			assc = Candidate.reflect_on_association(:course_scores)
	    expect(assc.macro).to eq :has_many
		end

		it "has many tests" do
			assc = Candidate.reflect_on_association(:tests)
	    expect(assc.macro).to eq :has_many
		end

		it "has many reviews" do
			assc = Candidate.reflect_on_association(:reviews)
	    expect(assc.macro).to eq :has_many
		end

		it "has many skills" do
			assc = Candidate.reflect_on_association(:skills)
	    expect(assc.macro).to eq :has_many
		end

		it "has many location" do
			assc = Candidate.reflect_on_association(:location)
	    expect(assc.macro).to eq :has_one
		end

		it "has many skill_assignments" do
			assc = Candidate.reflect_on_association(:skill_assignments)
	    expect(assc.macro).to eq :has_many
		end

		it "has many job_opportunities" do
			assc = Candidate.reflect_on_association(:job_opportunities)
	    expect(assc.macro).to eq :has_and_belongs_to_many
		end

		it "has many candidate_qualification_assignments" do
			assc = Candidate.reflect_on_association(:candidate_qualification_assignments)
	    expect(assc.macro).to eq :has_many
		end

		it "has many qualification_assignments" do
			assc = Candidate.reflect_on_association(:qualification_assignments)
	    expect(assc.macro).to eq :has_many
		end

		it "has many institutes" do
			assc = Candidate.reflect_on_association(:institutes)
	    expect(assc.macro).to eq :has_many
		end

		it "has many user" do
			assc = Candidate.reflect_on_association(:user)
	    expect(assc.macro).to eq :belongs_to
		end
	end

	describe Candidate, 'methods' do
	  context "when name_with_initial" do
	    it "should return full name(first_name + last_name)" do
				str = "  "+candidate.first_name+" "+candidate.last_name
	      expect(candidate.name_with_initial).to eql(str)
	    end
	  end

		context "when add_institute_with_qualification" do
		  it "should return candidate_qualification_assignment object" do
				candidate.save!
				institute.save!
				expect(institute).to be_valid
				qualification.save!
				expect(qualification).to be_valid
		    expect(candidate.add_institute_with_qualification(institute, qualification)).not_to eql(nil)
		  end
		end

		context "when get_institutes_with_qualifications" do
		  it "should return institutes_with_qualifications object" do
				candidate.save!
				institute.save!
				expect(institute).to be_valid
				qualification.save!
				expect(qualification).to be_valid
				expect(candidate.get_institutes_with_qualifications).not_to eql(nil)
		  end
		end
	end
end
