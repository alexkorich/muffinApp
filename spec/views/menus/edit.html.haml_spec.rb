require 'rails_helper'

RSpec.describe "menus/edit", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :first_course_dish_id => 1,
      :second_course_id => 1,
      :drink_id => 1,
      :order_id => 1
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input#menu_first_course_dish_id[name=?]", "menu[first_course_dish_id]"

      assert_select "input#menu_second_course_id[name=?]", "menu[second_course_id]"

      assert_select "input#menu_drink_id[name=?]", "menu[drink_id]"

      assert_select "input#menu_order_id[name=?]", "menu[order_id]"
    end
  end
end
