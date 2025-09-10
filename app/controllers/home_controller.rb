class HomeController < ApplicationController
  def index
    @form_type = params[:form] || "login"
    @user = User.new
    @login_user = User.new
    
    # Restore signup form data and errors from session if present
    if session[:signup_errors].present?
      @user.assign_attributes(session[:signup_params] || {})
      session[:signup_errors].each { |msg| @user.errors.add(:base, msg) }
      session.delete(:signup_errors)
      session.delete(:signup_params)
    end
    
    # Restore login form data and errors from session if present
    if session[:login_errors].present?
      @login_user.assign_attributes(session[:login_params] || {})
      session[:login_errors].each { |msg| @login_user.errors.add(:base, msg) }
      session.delete(:login_errors)
      session.delete(:login_params)
    end
  end
end
