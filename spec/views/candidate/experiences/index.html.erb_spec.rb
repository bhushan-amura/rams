require 'rails_helper'

RSpec.describe "candidate/experiences/index", type: :view do
  before(:each) do
    assign(:candidate_experiences, [
      Candidate::Experience.create!(),
      Candidate::Experience.create!()
    ])
  end

  it "renders a list of candidate/experiences" do
    render
  end
end
