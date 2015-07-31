require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        :first_course_dish_id => 1,
        :second_course_id => 2,
        :drink_id => 3,
        :order_id => 4
      ),
      Menu.create!(
        :first_course_dish_id => 1,
        :second_course_id => 2,
        :drink_id => 3,
        :order_id => 4
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
