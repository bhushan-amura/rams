require 'rails_helper'

RSpec.describe "candidate/experiences/edit", type: :view do
  before(:each) do
    @candidate_experience = assign(:candidate_experience, Candidate::Experience.create!())
  end

  it "renders the edit candidate_experience form" do
    render

    assert_select "form[action=?][method=?]", candidate_experience_path(@candidate_experience), "post" do
    end
  end
end
