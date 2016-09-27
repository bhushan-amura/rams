require 'rails_helper'

RSpec.describe "Candidate::Projects", type: :request do
  describe "GET /candidate_projects" do
    it "works! (now write some real specs)" do
      get candidate_projects_path
      expect(response).to have_http_status(200)
    end
  end
end
