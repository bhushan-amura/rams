require 'rails_helper'

RSpec.describe "candidate/experiences/show", type: :view do
  before(:each) do
    @candidate_experience = assign(:candidate_experience, Candidate::Experience.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
