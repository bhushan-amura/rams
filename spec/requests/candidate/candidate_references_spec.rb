require 'rails_helper'

RSpec.describe "Candidate::References", type: :request do
  describe "GET /candidate_references" do
    it "works! (now write some real specs)" do
      get candidate_references_path
      expect(response).to have_http_status(200)
    end
  end
end
