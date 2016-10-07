require 'rails_helper'

RSpec.describe CandidateQualificationAssignment, type: :model do

  context "when Association" do
    it "belongs to qualification assignment" do
      assc = CandidateQualificationAssignment.reflect_on_association(:qualification_assignment)
      expect(assc.macro).to eq :belongs_to
    end
    it "belongs to candidate" do
      assc = CandidateQualificationAssignment.reflect_on_association(:candidate)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
