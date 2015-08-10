class Admin::DishesController < ApplicationController
layout 'admin/layouts/application'
 def index
  @dishes=Dish.all
  end

  def show
  end

  def create
    puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSs"
    puts params
    @dish=Dish.new
    @dish.name=params[:dish][:name]
    @dish.type=params[:dish][:type]
    @dish.quantity=params[:dish][:quantity]
    @dish.price=params[:dish][:price]

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

  def update
  end

  def destroy
  end
end
