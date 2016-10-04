require 'rails_helper'

RSpec.describe "Candidate::Links", type: :request do
  describe "GET /candidate_links" do
    it "works! (now write some real specs)" do
      get candidate_links_path
      expect(response).to have_http_status(200)
    end
  end
end
