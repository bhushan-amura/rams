require 'rails_helper'

RSpec.describe Company::Event, type: :model do

  let(:event) {Company::Event.new(event_type:"Qww", organiser:"qw",date_time:Time.now, duration: 3)}

  let(:company){Company.new(name:"jayesh",company_type:"qwe",url:"qwe.com",tagline:"qwerty",phone:"1234567789",description:"qwerty ytrewq",number_of_employees:123,logo:"qwe")}

  let(:job_opportunity) {Company::JobOpportunity.new(title:"qweqwe", shift:"full time", description:"good one", number_of_positions:12)}

  context "model with attributes valid?" do
		it "is valid with valid attributes" do
		    expect(company).to be_valid
		    company.save!
		    company.job_opportunities << job_opportunity
		    expect(company.job_opportunities.first).to be_valid
		    expect(job_opportunity).to be_valid
		    job_opportunity.events << event
		    expect(company.job_opportunities.first.events.first).to be_valid
		 end
	end

  context 'event' do
    it "invalid! event_type field required" do
      event.event_type = ""
      expect(event).to be_invalid
    end

    it "invalid! when event_type length exceeds 255" do
      event.event_type = "a"*256
      expect(event).to be_invalid
    end

    it "invalid! date_time filed required" do
      event.date_time = ""
      expect(event).to be_invalid
    end

    it "invalid! duration field required" do
      event.duration = ""
      expect(event).to be_invalid
    end
  end
  
end
