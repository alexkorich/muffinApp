class Admin::DishesController < ApplicationController
layout 'admin/layouts/application'
 def index
  @dishes=Dish.all
  end

  def show
  end

  def create
    @dish=Dish.new(dish_params)
    respond_to do |format|
      if @dish.save
        format.html { redirect_to :back, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html {  redirect_to :back, notice: 'Something went wrong!' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

    def dish_params
      
      params.require(:dish).permit(:name, :type, :quantity, :price, :avatar)
    end
end
