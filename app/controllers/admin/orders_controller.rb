class Admin::OrdersController < ApplicationController
 layout 'admin/layouts/application'

 def index

 end

  def find_by_date
    puts "HHHHHHHHHHHHHHHHHHHHHHHH"
    @orders1=Order.where(date:params[:date])
    if @orders1 !=nil
      redirect_to  :action => 'show_by_day', date:params[:date], type:"many"
    else
      redirect_to :back, flash: {error: "Oops, there is no orders for that day!"}
    end
  end

  def find_by_user

  end

  def show
    if params[:type]=="one"
      @order=Order.find(params[:id])
    elsif params[:type]=="many"
    @orders=Order.where(date:params[:date])
      if @orders
      render 'show_by_day'
      else
      redirect_to 'admin/orders', flash: {error: "Oops, there is no orders for that day!"}
      end 
    end
  end
  def show_by_day
    
  end
  def update
  end

  def destroy
  end
end
