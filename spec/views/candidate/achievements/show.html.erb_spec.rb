require 'rails_helper'

RSpec.describe "candidate/achievements/show", type: :view do
  before(:each) do
    @candidate_achievement = assign(:candidate_achievement, Candidate::Achievement.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
