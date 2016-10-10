require 'rails_helper'

RSpec.describe Test, type: :model do
	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

	let(:test) {Test.new(name:"hackerRank",url:"https://relishapp.com/rspec/rspec-core/v/2-3/docs/command-line/tag-option",max_score:100)}

	let(:test_score) {Candidate::TestScore.new(score:67)}

	context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    expect(test).to be_valid
		    test.save!
		    test_score.test_id = test.id

		    candidate.test_scores << test_score
		    expect(candidate.test_scores.first).to be_valid
		 end
	end

	context "name" do
		it "invalid! field required." do
			test.name = ""
			expect(test).to be_invalid
		end

		it "invalid! character limit 21 exceeded." do
			test.name = "g"*21
			expect(test).to be_invalid
		end
	end


	context "url" do
		it "invalid! field required." do
			test.url = ""
			expect(test).to be_invalid
		end

		it "invalid! character limit 65535 exceeded." do
			test.url = "g"*65536
			expect(test).to be_invalid
		end
	end

	context "when Association" do
    it "has many test scores" do
      assc = Test.reflect_on_association(:test_scores)
      expect(assc.macro).to eq :has_many
    end
  end

end
