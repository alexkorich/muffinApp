require 'rails_helper'

RSpec.describe Order, type: :model do
  let (:order) { FactoryGirl.create :order }
  
  it "must have user" do
    expect(order).to validate_presence_of(:user)
  end 

  it "must have date" do
    expect(order).to validate_presence_of(:date)
  end 

it "could have 1 1st dish" do
    expect(order).to respond_to(:first_course_dish)
  end 

 it "could have 1 2nd dish" do
    expect(order).to respond_to(:second_course_dish)
  end 

  it "could have drink" do
    expect(order).to respond_to(:drink)
  end

  it "could have only 1 2nd dish" do
    expect(order).not_to respond_to(:second_course_dishes)
  end 

 it "could have only 1 1st dish" do
    expect(order).not_to respond_to(:first_course_dishes)
  end 

   it "could have only 1 drink" do
    expect(order).not_to respond_to(:drinks)
  end 

  it "must have at least 1 dish" do
    expect(FactoryGirl.build :order, first_course_dish:nil, second_course_dish:nil, drink:nil).not_to be_valid
    end
end
