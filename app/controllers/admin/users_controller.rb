class Admin::UsersController < ApplicationController
 layout 'admin/layouts/application'
  def index
    @users=User.all
  end

  def show
  end

  def update
  end

  def destroy
  end
end
