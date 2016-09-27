require 'rails_helper'

RSpec.describe "candidate/links/index", type: :view do
  before(:each) do
    assign(:candidate_links, [
      Candidate::Link.create!(),
      Candidate::Link.create!()
    ])
  end

  it "renders a list of candidate/links" do
    render
  end
end
