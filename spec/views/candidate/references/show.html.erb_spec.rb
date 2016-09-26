require 'rails_helper'

RSpec.describe "candidate/references/show", type: :view do
  before(:each) do
    @candidate_reference = assign(:candidate_reference, Candidate::Reference.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
