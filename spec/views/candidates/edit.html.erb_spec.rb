require 'rails_helper'

RSpec.describe "candidates/edit", type: :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!())
  end

  it "renders the edit candidate form" do
    render

    assert_select "form[action=?][method=?]", candidate_path(@candidate), "post" do
    end
  end
end
