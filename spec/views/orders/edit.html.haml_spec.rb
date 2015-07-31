require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :dish_id => 1,
      :user_id => 1,
      :menu_id => 1
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_dish_id[name=?]", "order[dish_id]"

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_menu_id[name=?]", "order[menu_id]"
    end
  end
end
