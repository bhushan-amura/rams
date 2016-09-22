require 'rails_helper'

RSpec.describe Company, type: :model do

  let(:company){Company.new(name:"jayesh",company_type:"qwe",url:"qwe.com",tagline:"qwerty",phone:"1234567789",description:"qwerty ytrewq",number_of_employees:123,logo:"qwe")}

  context 'Attributes' do
    it 'invalid if name is nil' do
      company.name = ""
      expect(company).to_not be_valid
    end

    # it 'invalid if email is nil' do
    #   company.email = "nil@email.com"
    #   expect(company).to be_valid
    # end

    it 'invalid if company type is nil' do
      company.company_type = nil
      expect(company).to_not be_valid
    end

    it 'invalid if description is nil' do
      company.description = nil
      expect(company).to_not be_valid
    end

    it 'invalid if url is nil' do
      company.url = nil
      expect(company).to_not be_valid
    end
  end

  context "Associations" do
    it "has many job oppurtunities" do
      assc = described_class.reflect_on_association(:job_opportunities)
      expect(assc.macro).to eq :has_many
    end

    it "has many reviews" do
      assc = described_class.reflect_on_association(:reviews)
      expect(assc.macro).to eq :has_many
    end

    it "has one location" do
      assc = described_class.reflect_on_association(:locations)
      expect(assc.macro).to eq :has_one
    end
  end

end
