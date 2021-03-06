class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    users_show_path
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :username
   devise_parameter_sanitizer.for(:account_update) << :username
  end


  before_action :authenticate_user!, except: [:index, :about]
end
