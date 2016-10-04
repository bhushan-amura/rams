require 'rails_helper'

RSpec.describe Location, type: :model do

  let(:candidate) {Candidate.new(first_name:"abcd",last_name:"efgh", dob:'1992/03/15', gender:'M', marital_status:"married",status:true, languages:"HIBRU", summary:"dont know",  phone:"12321442415",interests:"dddd")}

  let(:company){Company.new(name:"jayesh",company_type:"qwe",url:"qwe.com",tagline:"qwerty",phone:"1234567789",description:"qwerty ytrewq",number_of_employees:123,logo:"qwe")}

  let(:location) {Location.new(city: "New Erickaville", street_name: "Antonietta Street", street_address: "57611 MacGyver Pines", building_name: "facilis", building_number: "4691", zipcode: "89066-8916", state: "North Dakota", country: "Puerto Rico")}

  context "model with attributes valid?" do
    it "" do
      expect(location).to be_valid
      company.save!
      location.save!
      Company.first.location = location
      expect(Company.first.location).to be_valid
      candidate.save!
      Candidate.first.location = location
      expect(Candidate.first.location).to be_valid
    end
  end
  context "when city" do
    it "invalid! city required" do
      location.city = ""
      expect(location).to be_invalid
    end
    it "invalid! city length exceeds 255" do
      location.city = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when street_name" do
    it "invalid! street_name required" do
      location.street_name = ""
      expect(location).to be_invalid
    end
    it "invalid! street_name length exceeds 255" do
      location.street_name = "a"*256
      expect(location).to be_invalid
    end
  end

  context "when street_address" do
    it "invalid! street_address required" do
      location.street_address = ""
      expect(location).to be_invalid
    end
    it "invalid! street_address length exceeds 255" do
      location.street_address = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when building_name" do
    it "invalid! building_name required" do
      location.building_name = ""
      expect(location).to be_invalid
    end
    it "invalid! building_name length exceeds 255" do
      location.building_name = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when building_number" do
    it "invalid! building_number required" do
      location.building_number = nil
      expect(location).to be_valid
    end
  end
  context "when state" do
    it "invalid! state required" do
      location.state = ""
      expect(location).to be_invalid
    end
    it "invalid! state length exceeds 255" do
      location.state = "a"*256
      expect(location).to be_invalid
    end
  end

  context "when country" do
    it "invalid! country required" do
      location.country = ""
      expect(location).to be_invalid
    end
    it "invalid! country length exceeds 255" do
      location.country = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when zipcode" do
    it "invalid! zipcode required" do
      location.zipcode = ""
      expect(location).to be_invalid
    end
    it "invalid! zipcode length exceeds 255" do
      location.zipcode = "a"*256
      expect(location).to be_invalid
    end
  end
end
