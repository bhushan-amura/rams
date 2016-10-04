require 'rails_helper'

RSpec.describe "candidate/references/edit", type: :view do
  before(:each) do
    @candidate_reference = assign(:candidate_reference, Candidate::Reference.create!())
  end

  it "renders the edit candidate_reference form" do
    render

    assert_select "form[action=?][method=?]", candidate_reference_path(@candidate_reference), "post" do
    end
  end
end
