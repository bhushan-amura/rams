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
			expect(candidate.reviews.first).to eq: (company.reviews.first)
		end

#Person = Struct.new(:name, :age)
  # person = Person.new("Jim", 32)

  # expect(person).to have_attributes(:name => "Jim", :age => 32)
  # expect(person).to have_attributes(:name => a_string_starting_with("J"), :age => (a_value > 30) )



	end

	# context "link type" do
	# 	it "invalid! field required." do
	# 		link.link_type = ""
	# 		expect(link).to be_invalid
	# 	end

	# 	it "invalid! character limit 50 exceeded." do
	# 		link.link_type = "g"*51
	# 		expect(link).to be_invalid
	# 	end
	# end
end
