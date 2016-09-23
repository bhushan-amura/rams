require 'rails_helper'

RSpec.describe Candidate, type: :model do

	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

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


	# validates :email, :presence => true, :length => { :maximum => 100 },
	# 		 :format => EMAIL_REGEX, :confirmation => true,
	# 		 :uniqueness => true

	# context "email" do
	# 	it "invalid! field required." do
	# 		candidate.email = ""
	# 		expect(candidate).to be_invalid
	# 	end

	# 	it "invalid! character limit 100 exceeded." do
	# 	 	candidate.email = Faker::Internet.email
	# 	 	# puts candidate.email
	# 	 	expect(candidate).to be_valid
	# 	end
	# end

end
