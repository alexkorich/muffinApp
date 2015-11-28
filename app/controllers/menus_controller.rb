class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  authorize_resource
  # GET /menus
  # GET /menus.json
  def index
    @menu = Menu.find_by(date:Date.today)
    @menus =Menu.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end
  def find_by_date
    @menu1=Menu.find_by(date:params[:date])
    if @menu1
      redirect_to  :action => 'show', :id => @menu1.id
    else
      redirect_to :back, flash: {error: "Oops, there is no menu for that day!"}
    end
  end
  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.menu[:start_time]=DateTime.now
      params.require(:menu).permit(:date, start_time, :first_course_dish_id, :second_course_id, :drink_id, :order_id)
    end
end
