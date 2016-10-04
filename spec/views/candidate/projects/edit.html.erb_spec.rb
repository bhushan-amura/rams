require 'rails_helper'

RSpec.describe "candidate/projects/edit", type: :view do
  before(:each) do
    @candidate_project = assign(:candidate_project, Candidate::Project.create!())
  end

  it "renders the edit candidate_project form" do
    render

    assert_select "form[action=?][method=?]", candidate_project_path(@candidate_project), "post" do
    end
  end
end
