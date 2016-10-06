require 'rails_helper'

RSpec.describe Location, type: :model do

  before(:each) do
    @location = FactoryGirl.build(:location)
  end

  context "model with attributes valid?" do
    it "all the fields are valid" do
      # FactoryGirl.build(:location).should be_valid
      company = FactoryGirl.create(:company)
      candidate = FactoryGirl.build(:candidate)
      location = @location
      location.should be_valid
      location.save!
      company.location = location
      expect(company.location).to be_valid
      candidate.location = location
      expect(candidate.location).to be_valid
    end
  end
  context "when city" do
    it "invalid! city required" do
      location = @location
      location.city = ""
      expect(location).to be_invalid
    end
    it "invalid! city length exceeds 255" do
      location = @location
      location.city = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when street_name" do
    it "invalid! street_name required" do
      location = @location
      location.street_name = ""
      expect(location).to be_invalid
    end
    it "invalid! street_name length exceeds 255" do
      location = @location
      location.street_name = "a"*256
      expect(location).to be_invalid
    end
  end

  context "when street_address" do
    it "invalid! street_address required" do
      location = @location
      location.street_address = ""
      expect(location).to be_invalid
    end
    it "invalid! street_address length exceeds 255" do
      location = @location
      location.street_address = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when building_name" do
    it "invalid! building_name required" do
      location = @location
      location.building_name = ""
      expect(location).to be_invalid
    end
    it "invalid! building_name length exceeds 255" do
      location = @location
      location.building_name = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when building_number" do
    it "invalid! building_number required(optional)" do
      location = @location
      location.building_number = nil
      expect(location).to be_valid
    end
  end
  context "when state" do
    it "invalid! state required" do
      location = @location
      location.state = ""
      expect(location).to be_invalid
    end
    it "invalid! state length exceeds 255" do
      location = @location
      location.state = "a"*256
      expect(location).to be_invalid
    end
  end

  context "when country" do
    it "invalid! country required" do
      location = @location
      location.country = ""
      expect(location).to be_invalid
    end
    it "invalid! country length exceeds 255" do
      location = @location
      location.country = "a"*256
      expect(location).to be_invalid
    end
  end
  context "when zipcode" do
    it "invalid! zipcode required" do
      location = @location
      location.zipcode = ""
      expect(location).to be_invalid
    end
    it "invalid! zipcode length exceeds 255" do
      location = @location
      location.zipcode = "a"*256
      expect(location).to be_invalid
    end
  end

  context "Associations" do
    it "it belongs to locatable" do
      assc = Location.reflect_on_association(:locatable)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
