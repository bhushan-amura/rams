require "rails_helper"

RSpec.describe Candidate::ExperiencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/candidate/experiences").to route_to("candidate/experiences#index")
    end

    it "routes to #new" do
      expect(:get => "/candidate/experiences/new").to route_to("candidate/experiences#new")
    end

    it "routes to #show" do
      expect(:get => "/candidate/experiences/1").to route_to("candidate/experiences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/candidate/experiences/1/edit").to route_to("candidate/experiences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/candidate/experiences").to route_to("candidate/experiences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/candidate/experiences/1").to route_to("candidate/experiences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/candidate/experiences/1").to route_to("candidate/experiences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/candidate/experiences/1").to route_to("candidate/experiences#destroy", :id => "1")
    end

  end
end
