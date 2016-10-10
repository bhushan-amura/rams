require 'rails_helper'

RSpec.describe Candidate::TestScore, type: :model do

  let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

  let(:test) {Test.new(name:"hackerRank",url:"https://relishapp.com/rspec/rspec-core/v/2-3/docs/command-line/tag-option",max_score:100)}

  let(:test_score) {Candidate::TestScore.new(score: 50)}

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

  context "when Association" do
	  it "belongs to candidate" do
			assc = Candidate::TestScore.reflect_on_association(:candidate)
      expect(assc.macro).to eq :belongs_to
	  end

    it "belongs to test" do
			assc = Candidate::TestScore.reflect_on_association(:test)
      expect(assc.macro).to eq :belongs_to
	  end
	end

end
