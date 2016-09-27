require 'rails_helper'

RSpec.describe "candidate/course_scores/edit", type: :view do
  before(:each) do
    @candidate_course_score = assign(:candidate_course_score, Candidate::CourseScore.create!())
  end

  it "renders the edit candidate_course_score form" do
    render

    assert_select "form[action=?][method=?]", candidate_course_score_path(@candidate_course_score), "post" do
    end
  end
end
