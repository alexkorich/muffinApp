require 'rails_helper'

RSpec.describe "SecondCourseDishes", type: :request do
  describe "GET /second_course_dishes" do
    it "works! (now write some real specs)" do
      get second_course_dishes_path
      expect(response).to have_http_status(200)
    end
  end
end
