require 'rails_helper'

RSpec.describe Candidate::Link, type: :model do
	let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh",dob:'1992/03/15',gender:'M',marital_status:"married",status:true,languages:"HIBRU",summary:"dont know",phone:"12321442415",interests:"dddd")}

	let(:link) {Candidate::Link.new(type:"linkedin",url:"https://amuratech.hipchat.com/chat/room/3124190")}


	context "model with attributes valid?" do	
		it "is valid with valid attributes" do
		    expect(candidate).to be_valid
		    candidate.save!
		    candidate.links << link
		#     expect(candidate.link.first).to be_valid
		 end
	end

end
