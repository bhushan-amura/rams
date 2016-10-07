require 'rails_helper'

RSpec.describe "candidate/achievements/new", type: :view do
  before(:each) do
    assign(:candidate_achievement, Candidate::Achievement.new())
  end

  it "renders new candidate_achievement form" do
    render

    assert_select "form[action=?][method=?]", candidate_achievements_path, "post" do
    end
  end
end
