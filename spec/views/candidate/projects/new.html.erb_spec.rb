require 'rails_helper'

RSpec.describe "candidate/projects/new", type: :view do
  before(:each) do
    assign(:candidate_project, Candidate::Project.new())
  end

  it "renders new candidate_project form" do
    render

    assert_select "form[action=?][method=?]", candidate_projects_path, "post" do
    end
  end
end
