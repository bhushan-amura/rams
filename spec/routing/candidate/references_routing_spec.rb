require "rails_helper"

RSpec.describe Candidate::ReferencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/candidate/references").to route_to("candidate/references#index")
    end

    it "routes to #new" do
      expect(:get => "/candidate/references/new").to route_to("candidate/references#new")
    end

    it "routes to #show" do
      expect(:get => "/candidate/references/1").to route_to("candidate/references#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/candidate/references/1/edit").to route_to("candidate/references#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/candidate/references").to route_to("candidate/references#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/candidate/references/1").to route_to("candidate/references#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/candidate/references/1").to route_to("candidate/references#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/candidate/references/1").to route_to("candidate/references#destroy", :id => "1")
    end

  end
end
