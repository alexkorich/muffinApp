class Admin::DashboardController < ApplicationController
layout 'admin/layouts/application'
authorize_resource class: self
  def index
    
  end
end
