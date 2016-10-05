require 'rails_helper'

RSpec.describe QualificationAssignment, type: :model do
	context "when Association" do
    it "belongs to qualification" do
      assc = QualificationAssignment.reflect_on_association(:qualification)
      expect(assc.macro).to eq :belongs_to
    end
    it "belongs to qualifiable" do
      assc = QualificationAssignment.reflect_on_association(:qualifiable)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
