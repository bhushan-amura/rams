require 'rails_helper'

RSpec.describe "candidate/course_scores/show", type: :view do
  before(:each) do
    @candidate_course_score = assign(:candidate_course_score, Candidate::CourseScore.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
