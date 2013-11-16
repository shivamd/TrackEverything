class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    current_user_path
  end

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(:email, :password, :password_confirmation, :time_zone)
    end
    devise_parameter_sanitizer.for(:account_update) do |user|
      user.permit(:email, :password, :password_confirmation,:current_password, :time_zone)
    end
  end
end
