class HomeController < ApplicationController
  def index
    @form_type = params[:form] || "login"
    @user = User.new
    
    # Restore signup form data and errors from session if present
    if session[:signup_errors].present?
      @user.assign_attributes(session[:signup_params] || {})
      session[:signup_errors].each { |msg| @user.errors.add(:base, msg) }
      session.delete(:signup_errors)
      session.delete(:signup_params)
    end
  end
end
