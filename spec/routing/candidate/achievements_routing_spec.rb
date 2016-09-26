require "rails_helper"

RSpec.describe Candidate::AchievementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/candidate/achievements").to route_to("candidate/achievements#index")
    end

    it "routes to #new" do
      expect(:get => "/candidate/achievements/new").to route_to("candidate/achievements#new")
    end

    it "routes to #show" do
      expect(:get => "/candidate/achievements/1").to route_to("candidate/achievements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/candidate/achievements/1/edit").to route_to("candidate/achievements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/candidate/achievements").to route_to("candidate/achievements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/candidate/achievements/1").to route_to("candidate/achievements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/candidate/achievements/1").to route_to("candidate/achievements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/candidate/achievements/1").to route_to("candidate/achievements#destroy", :id => "1")
    end

  end
end
