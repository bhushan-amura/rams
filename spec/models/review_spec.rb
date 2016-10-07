require 'rails_helper'

RSpec.describe Review, type: :model do
	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

	let(:company){Company.new(name:"jayesh",company_type:"qwe",url:"qwe.com",tagline:"qwerty",phone:"1234567789",description:"qwerty ytrewq",number_of_employees:123,logo:"qwe")}

	let(:review) {Review.new(text:"satisfied with the process conducted",rating:5)}



	context "model with attributes valid?" do
		it "is valid with candidate valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    # candidate.links << link
		    # expect(candidate.links.first).to be_valid
		 end
		it "is valid with company valid attributes" do
			expect(company).to be_valid
			company.save!
		end
		it "is valid with review" do
			candidate.save!
			company.save!
			candidate.reviews << review
			company.reviews << review
			expect(candidate.reviews.first).to have_attributes(text:"satisfied with the process conducted",rating:5)
			expect(company.reviews.first).to have_attributes(text:"satisfied with the process conducted",rating:5)
		end
	end

	context "text" do
		it "invalid! character limit 65535 exceeded." do
			review.text = "g"*65536
			expect(review).to be_invalid
		end
	end

	context "rating" do
		it "invalid! must be in between 1-5." do
			review.rating = 6
			expect(review).to be_invalid
			expect(review.rating).to be > 5
			expect(review).to be_invalid
		end
	end

	context "when Association" do
	  it "belongs to candidate" do
			assc = Review.reflect_on_association(:candidate)
      expect(assc.macro).to eq :belongs_to
	  end

		it "belongs to company" do
			assc = Review.reflect_on_association(:company)
      expect(assc.macro).to eq :belongs_to
	  end
	end
end
