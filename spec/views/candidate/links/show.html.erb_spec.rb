require 'rails_helper'

RSpec.describe "candidate/links/show", type: :view do
  before(:each) do
    @candidate_link = assign(:candidate_link, Candidate::Link.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
