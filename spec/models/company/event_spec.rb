require 'rails_helper'

RSpec.describe Company::Event, type: :model do

  before(:each) do
    @event = FactoryGirl.build(:event)
  end
  # let(:event) {Company::Event.new(event_type:"Qww", organiser:"qw",date_time:Time.now, duration: 3)}

  # let(:company){Company.new(name:"jayesh",company_type:"qwe",url:"qwe.com",tagline:"qwerty",phone:"1234567789",description:"qwerty ytrewq",number_of_employees:123,logo:"qwe")}

  # let(:job_opportunity) {Company::JobOpportunity.new(title:"qweqwe", shift:"full time", description:"good one", number_of_positions:12)}

  context "model with attributes valid?" do
		it "is valid with valid attributes" do
      event = @event
      company = FactoryGirl.create(:company)
	    company.should be_valid
	    company.save!
      job = FactoryGirl.create(:job_opportunity)
	    company.job_opportunities << job
	    expect(company.job_opportunities.first).to be_valid
	    job.should be_valid
	    job.events << event
	    expect(company.job_opportunities.first.events.first).to be_valid
		 end
	end

  context 'event' do
    it "invalid! event_type field required" do
      event = @event
      event.event_type = ""
      expect(event).to be_invalid
    end

    it "invalid! when event_type length exceeds 255" do
      event = @event
      event.event_type = "a"*256
      expect(event).to be_invalid
    end

    it "invalid! date_time filed required" do
      event = @event
      event.date_time = ""
      expect(event).to be_invalid
    end

    it "invalid! duration field required" do
      event = @event
      event.duration = ""
      expect(event).to be_invalid
    end
  end

  context "when Association" do
	  it "belongs to job opportunity" do
			assc = Company::Event.reflect_on_association(:job_opportunity)
      expect(assc.macro).to eq :belongs_to
	  end

    it "has one location" do
			assc = Company::Event.reflect_on_association(:location)
      expect(assc.macro).to eq :has_one
	  end
  end

end
