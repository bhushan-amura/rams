require 'rails_helper'

RSpec.describe "candidate/references/index", type: :view do
  before(:each) do
    assign(:candidate_references, [
      Candidate::Reference.create!(),
      Candidate::Reference.create!()
    ])
  end

  it "renders a list of candidate/references" do
    render
  end
end
