require 'rails_helper'

RSpec.describe Candidate::CourseScore, type: :model do

	let(:course_score) {Candidate::CourseScore.new(end_year:'12-12-12', score:150)}

	context "model with attributes valid?" do
		it "is valid with candidate valid attributes" do
		    expect(course_score).to be_valid
		 end
	end

	context "attribute score" do
		it "invalid! score should not be empty." do
			course_score.score = ""
			expect(course_score).to be_invalid
		end
	end

	context "attribute end_year" do
		it "invalid! end_year should not be empty." do
			course_score.end_year = ""
			expect(course_score).to be_invalid
		end
	end

	context "when Association" do
	  it "belongs to candidate" do
			assc = Candidate::CourseScore.reflect_on_association(:candidate)
      expect(assc.macro).to eq :belongs_to
	  end

		it "belongs to qualification" do
			assc = Candidate::CourseScore.reflect_on_association(:qualification)
      expect(assc.macro).to eq :belongs_to
	  end
	end
end
