require 'rails_helper'



RSpec.describe Menu, type: :model do
  let(:menu) { FactoryGirl.create :menu }

it "must have date" do
  expect(FactoryGirl.build :menu, date:nil).not_to be_valid
end


  # replace presence to method
xit "must have 1st dish" do
  expect(FactoryGirl.build :menu, first_course_dishes:nil).not_to be_valid
end

xit "must have 2nd dish" do
  expect(FactoryGirl.build :menu, second_course_dishes:nil).not_to be_valid
end

xit "must have drinks" do
  expect(FactoryGirl.build :menu, drinks:nil).not_to be_valid
end

it "is only for one day" do
  menu
  expect(FactoryGirl.build :menu).not_to be_valid
end
it "has many 1st" do
  
  expect(menu).to respond_to :first_course_dishes
end

it "has many 2st" do
  
  expect(menu).to respond_to :second_course_dishes
end

it "has many drinks" do
  
  expect(menu).to respond_to :drinks
end


end
 