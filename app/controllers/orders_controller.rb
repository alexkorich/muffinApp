class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(user:current_user)
    puts @orders
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end
 
  def create
    params[:order]=params["menu"]
    if (params[:order])&&(params[:order][:first_course_dish_ids] || params[:order][:second_course_dish_ids] || params[:order][:drink_ids])
      @order = Order.new(order_params)
      @order.date=Date.today
      @order.user_id=current_user.id

      @order.first_course_dish=FirstCourseDish.find(params[:order][:first_course_dish_ids]) if params[:order][:first_course_dish_ids]
      @order.second_course_dish=SecondCourseDish.find(params[:order][:second_course_dish_ids]) if params[:order][:second_course_dish_ids]
      @order.drink=Drink.find(params[:order][:drink_ids]) if params[:order][:drinks]
      
      respond_to do |format|
        if @order.save
          format.html { render :show, location: @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { redirect_to :back, notice: @order.errors }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
     redirect_to :back, notice: 'You need at least one item!'
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      
      params.require(:order).permit(:first_course_dish_id, :second_course_dish_id, :drink_id)
    end
end
