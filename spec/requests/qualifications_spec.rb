require 'rails_helper'

RSpec.describe "Qualifications", type: :request do
  describe "GET /qualifications" do
    it "works! (now write some real specs)" do
      get qualifications_path
      expect(response).to have_http_status(200)
    end
  end
end
