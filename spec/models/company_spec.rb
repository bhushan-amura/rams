require 'rails_helper'

RSpec.describe Company, type: :model do

  let(:company){Company.new(name:"jayesh",company_type:"qwe",url:"qwe.com",tagline:"qwerty",phone:"1234567789",description:"qwerty ytrewq",number_of_employees:123,logo:"qwe")}

  let(:event){ Company::Event.new(event_type:'interview', organiser:'qwerty', date_time:'12-12-12',duration: 3, company_job_opportunity_id: 2) }

  let(:job) {Company::JobOpportunity.new(title:'qwerty',shift:"qwerty", description:'qwerty', number_of_positions: 150, status:'seeker', ctc:'12',experience: 1, company_id: company.id)}


  context 'Attributes' do
    it 'invalid if name is nil' do
      company.name = ""
      expect(company).to_not be_valid
    end

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

  describe Company, "when methods" do
    context "when recent_events is called" do
      it "should return list" do
        company.save!
        job.save!
        expect(job).to be_valid
        job.events << event
        expect(job.events.first).to be_valid
      end
    end
  end

end
