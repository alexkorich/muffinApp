require 'rails_helper'

RSpec.describe Dish, type: :model do
  let(:dish) { FactoryGirl.create :dish }
  let(:first_dish) { FactoryGirl.create :first_course_dish }
  let(:second_dish) { FactoryGirl.create :second_course_dish }
  let(:drink) { FactoryGirl.create :drink}


  it 'invalid without name' do 
  expect(FactoryGirl.build :dish, name: nil).not_to be_valid
  end

it 'must have unique name' do 
  FactoryGirl.create :dish, name: "dish1"
  expect(FactoryGirl.build :dish, name:  "dish1").not_to be_valid
  end
it 'invalid without price' do 
  expect(FactoryGirl.build :dish, price: nil).not_to be_valid
  end

it 'invalid without quantity' do 
  expect(FactoryGirl.build :dish, quantity: nil).not_to be_valid
  end
it 'has many menus' do 
  expect(dish).to respond_to :menus
  end
it 'has many orders' do 
  expect(dish).to respond_to :orders
  end
it 'has many orders' do 
  expect(dish).to respond_to :orders
end
  context "type" do
    it 'has type' do
      expect(dish).to respond_to :type
    end

    it 'could be 1st course' do
      expect(first_dish.type).to eq "FirstCourseDish"
    end
    it 'could be 2st course' do
      expect(second_dish.type).to eq "SecondCourseDish"
    end
    it 'could be drink' do
      expect(drink.type).to eq "Drink"
    end
    it 'could be called as dish' do
      expect(drink.parent).to eq "Dish"
    end
  end 

end
