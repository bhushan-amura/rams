require 'rails_helper'

RSpec.describe Candidate::Institute, type: :model do

  let(:institute) {Institute.new(university:"sppu",campus:"pict")}

  context "when Attributes" do
    it "invalid! when university is not present" do
        institute.university = ""
        expect(institute).to be_invalid
    end

    it "invalid! when campus is not present" do
        institute.campus = ""
        expect(institute).to be_invalid
    end
  end
  context "when Association" do
    it "has many qualifications" do
      assc = Institute.reflect_on_association(:qualifications)
      expect(assc.macro).to eq :has_many
    end

    it "has many qualification_assignments" do
      assc = Institute.reflect_on_association(:qualification_assignments)
      expect(assc.macro).to eq :has_many
    end
  end
end
