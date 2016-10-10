require 'rails_helper'

RSpec.describe Company, type: :model do

  before (:each) do
    @company = FactoryGirl.build(:company)
  end

  context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    company = @company
        company.should be_valid
		end
	end

  context 'Attributes' do
    it 'invalid if name is nil' do
      company = @company
      company.name = ""
      expect(company).to_not be_valid
    end

    it 'invalid if company type is nil' do
      company = @company
      company.company_type = nil
      expect(company).to_not be_valid
    end

    it 'invalid if description is nil' do
      company = @company
      company.description = nil
      expect(company).to_not be_valid
    end

    it 'invalid if url is nil' do
      company = @company
      company.url = nil
      expect(company).to_not be_valid
    end
  end

  context "Associations" do
    it "has many job oppurtunities" do
      assc = Company.reflect_on_association(:job_opportunities)
      expect(assc.macro).to eq :has_many
    end

    it "has many reviews" do
      assc = Company.reflect_on_association(:reviews)
      expect(assc.macro).to eq :has_many
    end

    it "has one location" do
      assc = Company.reflect_on_association(:location)
      expect(assc.macro).to eq :has_one
    end

    it "it belongs to user" do
      assc = Company.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe "when methods" do
    context "when recent_events is called" do
      it "should return list" do
        company = @company
        company.save!
        events = FactoryGirl.create_list(:event,8)
        job = FactoryGirl.create(:job_opportunity)
        job.events << events
        company.job_opportunities << job
        expect(company.recent_events(3)).to be_truthy
      end
    end
  end

end
