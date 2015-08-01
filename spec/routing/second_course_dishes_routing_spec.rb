require "rails_helper"

RSpec.describe SecondCourseDishesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/second_course_dishes").to route_to("second_course_dishes#index")
    end

    it "routes to #new" do
      expect(:get => "/second_course_dishes/new").to route_to("second_course_dishes#new")
    end

    it "routes to #show" do
      expect(:get => "/second_course_dishes/1").to route_to("second_course_dishes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/second_course_dishes/1/edit").to route_to("second_course_dishes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/second_course_dishes").to route_to("second_course_dishes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/second_course_dishes/1").to route_to("second_course_dishes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/second_course_dishes/1").to route_to("second_course_dishes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/second_course_dishes/1").to route_to("second_course_dishes#destroy", :id => "1")
    end

  end
end
