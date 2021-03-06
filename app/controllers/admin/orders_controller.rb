class Admin::OrdersController < ApplicationController
 layout 'admin/layouts/application'
  load_and_authorize_resource
 def index
  @orders=Order.all
 end

  def find_by_date
    @orders1=Order.where(date:params[:date])
    if @orders1.exists?
      redirect_to :controller => 'admin/orders', :action => 'show', date:params[:date], type:"many"
    else
      redirect_to :back, flash: {error: "Oops, there is no orders for that day!"}
    end
  end

  def find_by_user
    @orders=Order.where(user_id:params[:user_id])
    if @orders.exists?
      render 'show_user'
    else
     redirect_to :back, flash: {error: "This user has no orders!"}
    end
  end

  def show
    if params[:type]==="one"
     @order=Order.find(params[:id])
     if @order
      render 'show'
      else
         redirect_to 'admin/orders', flash: {error: "Oops, there is no orders for that day!"}
      end
    elsif params[:type]==="many"
      @orders=Order.where(date:params[:date])
      if @orders.exists?
      render 'show_by_day'
      else
      redirect_to 'admin/orders', flash: {error: "Oops, there is no orders for that day!"}
      end 
    end
  end
end
