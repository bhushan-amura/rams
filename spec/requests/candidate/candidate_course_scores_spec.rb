require 'rails_helper'

RSpec.describe "Candidate::CourseScores", type: :request do
  describe "GET /candidate_course_scores" do
    it "works! (now write some real specs)" do
      get candidate_course_scores_path
      expect(response).to have_http_status(200)
    end
  end
end
