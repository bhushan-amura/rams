require "rails_helper"

RSpec.describe Company::JobOpportunitiesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/company/job_opportunities").to route_to("company/job_opportunities#index")
    end

    it "routes to #new" do
      expect(:get => "/company/job_opportunities/new").to route_to("company/job_opportunities#new")
    end

    it "routes to #show" do
      expect(:get => "/company/job_opportunities/1").to route_to("company/job_opportunities#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/company/job_opportunities/1/edit").to route_to("company/job_opportunities#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/company/job_opportunities").to route_to("company/job_opportunities#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/company/job_opportunities/1").to route_to("company/job_opportunities#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/company/job_opportunities/1").to route_to("company/job_opportunities#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/company/job_opportunities/1").to route_to("company/job_opportunities#destroy", :id => "1")
    end

  end
end
