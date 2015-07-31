require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :first_course_dish_id => 1,
      :second_course_dish_id => 1,
      :drink_id => 1,
      :user_id => 1,
      :menu_id => 1
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_first_course_dish_id[name=?]", "order[first_course_dish_id]"

      assert_select "input#order_second_course_dish_id[name=?]", "order[second_course_dish_id]"

      assert_select "input#order_drink_id[name=?]", "order[drink_id]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_menu_id[name=?]", "order[menu_id]"
    end
  end
end
