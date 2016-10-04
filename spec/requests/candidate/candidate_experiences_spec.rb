require 'rails_helper'

RSpec.describe "Candidate::Experiences", type: :request do
  describe "GET /candidate_experiences" do
    it "works! (now write some real specs)" do
      get candidate_experiences_path
      expect(response).to have_http_status(200)
    end
  end
end
