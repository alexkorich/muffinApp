class Admin::DashboardController < ApplicationController
layout 'admin/layouts/application'
authorize_resource class: self
  def index
    @orders=Order.where(date:Date.today)
    @menu=Menu.find_by(date:Date.today)
    @first=FirstCourseDish.all
    @second=SecondCourseDish.all
    @drink=Drink.all
  end
end
