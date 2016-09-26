require 'rails_helper'

RSpec.describe "candidate/achievements/edit", type: :view do
  before(:each) do
    @candidate_achievement = assign(:candidate_achievement, Candidate::Achievement.create!())
  end

  it "renders the edit candidate_achievement form" do
    render

    assert_select "form[action=?][method=?]", candidate_achievement_path(@candidate_achievement), "post" do
    end
  end
end
