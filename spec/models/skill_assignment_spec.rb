require 'rails_helper'

RSpec.describe SkillAssignment, type: :model do
	context "when Association" do
    it "belongs to Skill" do
      assc = SkillAssignment.reflect_on_association(:skill)
      expect(assc.macro).to eq :belongs_to
    end
    it "belongs to candidate" do
      assc = SkillAssignment.reflect_on_association(:skillable)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
