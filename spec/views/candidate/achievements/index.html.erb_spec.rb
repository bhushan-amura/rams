require 'rails_helper'

RSpec.describe "candidate/achievements/index", type: :view do
  before(:each) do
    assign(:candidate_achievements, [
      Candidate::Achievement.create!(),
      Candidate::Achievement.create!()
    ])
  end

  it "renders a list of candidate/achievements" do
    render
  end
end
