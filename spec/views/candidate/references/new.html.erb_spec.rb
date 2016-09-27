require 'rails_helper'

RSpec.describe "candidate/references/new", type: :view do
  before(:each) do
    assign(:candidate_reference, Candidate::Reference.new())
  end

  it "renders new candidate_reference form" do
    render

    assert_select "form[action=?][method=?]", candidate_references_path, "post" do
    end
  end
end
