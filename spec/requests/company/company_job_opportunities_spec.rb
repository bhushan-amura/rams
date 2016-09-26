require 'rails_helper'

RSpec.describe "Company::JobOpportunities", type: :request do
  describe "GET /company_job_opportunities" do
    it "works! (now write some real specs)" do
      get company_job_opportunities_path
      expect(response).to have_http_status(200)
    end
  end
end
