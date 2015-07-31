require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :first_course_dish_id => 1,
        :second_course_dish_id => 2,
        :drink_id => 3,
        :user_id => 4,
        :menu_id => 5
      ),
      Order.create!(
        :first_course_dish_id => 1,
        :second_course_dish_id => 2,
        :drink_id => 3,
        :user_id => 4,
        :menu_id => 5
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
