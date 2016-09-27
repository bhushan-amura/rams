require "rails_helper"

RSpec.describe Company::EventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/company/events").to route_to("company/events#index")
    end

    it "routes to #new" do
      expect(:get => "/company/events/new").to route_to("company/events#new")
    end

    it "routes to #show" do
      expect(:get => "/company/events/1").to route_to("company/events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/company/events/1/edit").to route_to("company/events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/company/events").to route_to("company/events#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/company/events/1").to route_to("company/events#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/company/events/1").to route_to("company/events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/company/events/1").to route_to("company/events#destroy", :id => "1")
    end

  end
end
