require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(),
      Candidate.create!()
    ])
  end

  it "renders a list of candidates" do
    render
  end
end
