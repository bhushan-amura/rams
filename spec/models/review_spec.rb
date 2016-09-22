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
		it "invalid! field required." do
			review.text = ""
			expect(review).to be_invalid
		end

		it "invalid! character limit 50 exceeded." do
			review.text = "g"*51
			expect(review).to be_invalid
		end
	end

	context "rating" do
		it "invalid! must be in between 1-5." do
			# review.rating = 4#(1..5).to_a.sample
			# expect(review).to be_valid
			# expect(2).to be_within(1).of(5)
			# expect(review).to validate_inclusion_of(:rating).in_array((1..5).to_a)
		end
	end

end