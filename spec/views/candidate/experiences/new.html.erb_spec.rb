require 'rails_helper'

RSpec.describe "candidate/experiences/new", type: :view do
  before(:each) do
    assign(:candidate_experience, Candidate::Experience.new())
  end

  it "renders new candidate_experience form" do
    render

    assert_select "form[action=?][method=?]", candidate_experiences_path, "post" do
    end
  end
end
