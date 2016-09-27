require 'rails_helper'

RSpec.describe "candidate/course_scores/new", type: :view do
  before(:each) do
    assign(:candidate_course_score, Candidate::CourseScore.new())
  end

  it "renders new candidate_course_score form" do
    render

    assert_select "form[action=?][method=?]", candidate_course_scores_path, "post" do
    end
  end
end
