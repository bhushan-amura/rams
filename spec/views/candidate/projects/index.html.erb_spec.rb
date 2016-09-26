require 'rails_helper'

RSpec.describe "candidate/projects/index", type: :view do
  before(:each) do
    assign(:candidate_projects, [
      Candidate::Project.create!(),
      Candidate::Project.create!()
    ])
  end

  it "renders a list of candidate/projects" do
    render
  end
end
