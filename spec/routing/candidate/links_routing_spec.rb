require "rails_helper"

RSpec.describe Candidate::LinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/candidate/links").to route_to("candidate/links#index")
    end

    it "routes to #new" do
      expect(:get => "/candidate/links/new").to route_to("candidate/links#new")
    end

    it "routes to #show" do
      expect(:get => "/candidate/links/1").to route_to("candidate/links#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/candidate/links/1/edit").to route_to("candidate/links#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/candidate/links").to route_to("candidate/links#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/candidate/links/1").to route_to("candidate/links#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/candidate/links/1").to route_to("candidate/links#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/candidate/links/1").to route_to("candidate/links#destroy", :id => "1")
    end

  end
end
