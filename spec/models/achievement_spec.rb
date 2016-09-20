require 'rails_helper'

RSpec.describe Achievement, type: :model do
	
		let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',email:'jayesh@gmail.com',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

		

		context "model with attributes valid?" do	
			it "is valid with valid attributes" do
			    expect(candidate).to be_valid
			end
		end
	


end

