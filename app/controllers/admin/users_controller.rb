class Admin::UsersController < ApplicationController
 layout 'admin/layouts/application'
 before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users=User.all
  end

  def show
  end

  def update
  end

  def destroy
     @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
  end
end
