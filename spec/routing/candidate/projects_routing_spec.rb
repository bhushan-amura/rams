require "rails_helper"

RSpec.describe Candidate::ProjectsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/candidate/projects").to route_to("candidate/projects#index")
    end

    it "routes to #new" do
      expect(:get => "/candidate/projects/new").to route_to("candidate/projects#new")
    end

    it "routes to #show" do
      expect(:get => "/candidate/projects/1").to route_to("candidate/projects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/candidate/projects/1/edit").to route_to("candidate/projects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/candidate/projects").to route_to("candidate/projects#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/candidate/projects/1").to route_to("candidate/projects#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/candidate/projects/1").to route_to("candidate/projects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/candidate/projects/1").to route_to("candidate/projects#destroy", :id => "1")
    end

  end
end
