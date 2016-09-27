require 'rails_helper'

RSpec.describe "candidate/projects/show", type: :view do
  before(:each) do
    @candidate_project = assign(:candidate_project, Candidate::Project.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
