class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
      if user_signed_in?
        flash[:error] = "Not authorized to view this page"
        session[:user_return_to] = nil
        redirect_to '/'

      else              
        flash[:error] = "You must first login to view this page"
        session[:user_return_to] = request.url
        redirect_to "/users/sign_in"
      end 

  end


 protected
  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
