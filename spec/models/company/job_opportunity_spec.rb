require 'rails_helper'

RSpec.describe Company::JobOpportunity, type: :model do
  let(:event) {Company::Event.new(event_type:"Qww", organiser:"qw",date_time:Time.now, duration: 3)}

  let(:company){Company.new(name:"jayesh",company_type:"qwe",url:"qwe.com",tagline:"qwerty",phone:"1234567789",description:"qwerty ytrewq",number_of_employees:123,logo:"qwe")}

  let(:job_opportunity) {Company::JobOpportunity.new(title:"qweqwe", shift:"full time", description:"good one", number_of_positions:12)}

  let(:candidate) { FactoryGirl.build(:candidate) }


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

    it "has many candidates" do
      assc = Company::JobOpportunity.reflect_on_association(:selected_candidates)
      expect(assc.macro).to eq :has_many
    end
  end

  context "methods" do

    it  "should shortlist candidates" do
      job_opportunity.save!
      expect(job_opportunity.shortlist_candidates).to_not be_nil
    end

    it "should get recent jobs" do
      job_opportunity.save!
      expect(Company::JobOpportunity.get_recent_jobs).to_not be_nil
    end

    it "should select candidates" do
      job_opportunity.save!
      candidate.save!
      job_opportunity.select_candidate(candidate)
      expect(job_opportunity.selected_candidates).to_not be_nil
    end

    it "should get candidates as users" do
      job_opportunity.save!
      candidate.save!
      job_opportunity.select_candidate(candidate)
      expect(job_opportunity.get_candidates_as_users.first).to be_an_instance_of(User)
    end

    it "should change status" do
      job_opportunity.save!
      candidate.save!
      job_opportunity.select_candidate(candidate)
      job_opportunity.change_status(candidate,:mailed)
      expect(CandidatesJobOpportunity.find_by(candidate_id:candidate.id,job_opportunity_id:job_opportunity.id).status).to eq("mailed")
    end

    it "should get candidates with status" do
      job_opportunity.save!
      candidate.save!
      job_opportunity.select_candidate(candidate)
      expect(job_opportunity.get_candidates_with_status.first.status).to_not be_nil
    end

  end

end
