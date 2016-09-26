require 'rails_helper'

RSpec.describe "Candidate::Achievements", type: :request do
  describe "GET /candidate_achievements" do
    it "works! (now write some real specs)" do
      get candidate_achievements_path
      expect(response).to have_http_status(200)
    end
  end
end
