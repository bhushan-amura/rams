require 'rails_helper'

RSpec.describe Company::JobOpportunity, type: :model do
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

  context "title" do
    it "invalid! title field required" do
      job_opportunity.title = ""
      expect(job_opportunity).to be_invalid
    end
    it "invalid! title length exceeds 255" do
      job_opportunity.title = "a"*256
      expect(job_opportunity).to be_invalid
    end
  end
  context "shift" do
    it "invalid! shift field required" do
      job_opportunity.shift = ""
      expect(job_opportunity).to be_invalid
    end
    it "invalid! shift length exceeds 255" do
      job_opportunity.shift = "a"*256
      expect(job_opportunity).to be_invalid
    end
  end

  context "description" do
    it "invalid! description field required" do
      job_opportunity.description = ""
      expect(job_opportunity).to be_invalid
    end
    it "invalid! description length exceeds 65535" do
      job_opportunity.description = "a"*65536
      expect(job_opportunity).to be_invalid
    end
  end

  context "number_of_positions" do
    it "invalid! number_of_positions field required" do
      job_opportunity.number_of_positions = ""
      expect(job_opportunity).to be_invalid
    end
  end

  context "when Association" do
    it "has many events" do
      assc = Company::JobOpportunity.reflect_on_association(:events)
      expect(assc.macro).to eq :has_many
    end

    it "has many skill_assignments" do
      assc = Company::JobOpportunity.reflect_on_association(:skill_assignments)
      expect(assc.macro).to eq :has_many
    end

    it "has many skills" do
      assc = Company::JobOpportunity.reflect_on_association(:skills)
      expect(assc.macro).to eq :has_many
    end

    it "has many qualification_assignments" do
      assc = Company::JobOpportunity.reflect_on_association(:qualification_assignments)
      expect(assc.macro).to eq :has_many
    end

    it "has many qualifications" do
      assc = Company::JobOpportunity.reflect_on_association(:qualifications)
      expect(assc.macro).to eq :has_many
    end

    it "has and belong to many candidates" do
      assc = Company::JobOpportunity.reflect_on_association(:candidates)
      expect(assc.macro).to eq :has_and_belongs_to_many
    end
  end

end
