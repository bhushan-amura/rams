require "rails_helper"

RSpec.describe Candidate::CourseScoresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/candidate/course_scores").to route_to("candidate/course_scores#index")
    end

    it "routes to #new" do
      expect(:get => "/candidate/course_scores/new").to route_to("candidate/course_scores#new")
    end

    it "routes to #show" do
      expect(:get => "/candidate/course_scores/1").to route_to("candidate/course_scores#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/candidate/course_scores/1/edit").to route_to("candidate/course_scores#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/candidate/course_scores").to route_to("candidate/course_scores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/candidate/course_scores/1").to route_to("candidate/course_scores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/candidate/course_scores/1").to route_to("candidate/course_scores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/candidate/course_scores/1").to route_to("candidate/course_scores#destroy", :id => "1")
    end

  end
end
