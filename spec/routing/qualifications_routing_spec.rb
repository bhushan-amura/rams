require "rails_helper"

RSpec.describe QualificationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/qualifications").to route_to("qualifications#index")
    end

    it "routes to #new" do
      expect(:get => "/qualifications/new").to route_to("qualifications#new")
    end

    it "routes to #show" do
      expect(:get => "/qualifications/1").to route_to("qualifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/qualifications/1/edit").to route_to("qualifications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/qualifications").to route_to("qualifications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/qualifications/1").to route_to("qualifications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/qualifications/1").to route_to("qualifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/qualifications/1").to route_to("qualifications#destroy", :id => "1")
    end

  end
end
