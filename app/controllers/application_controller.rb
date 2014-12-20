class ApplicationController < ActionController::Base
  # reset captcha code after each request for security
  after_filter :reset_last_captcha_code!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:email, :captcha)
    devise_parameter_sanitizer.for(:sign_in).push(:email)
    devise_parameter_sanitizer.for(:account_update).push(:login, :email)
  end

end
