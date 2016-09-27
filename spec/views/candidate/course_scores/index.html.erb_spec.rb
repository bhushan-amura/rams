require 'rails_helper'

RSpec.describe "candidate/course_scores/index", type: :view do
  before(:each) do
    assign(:candidate_course_scores, [
      Candidate::CourseScore.create!(),
      Candidate::CourseScore.create!()
    ])
  end

  it "renders a list of candidate/course_scores" do
    render
  end
end
