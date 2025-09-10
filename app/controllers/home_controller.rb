class HomeController < ApplicationController
  def index
    @form_type = params[:form] || "login"
    @user = User.new
    @login_user = User.new

    restore_signup_errors
    restore_login_errors
  end

private

  def restore_signup_errors
    return unless session[:signup_errors].present?

    @user.assign_attributes(session[:signup_params] || {})
    session[:signup_errors].each { |msg| @user.errors.add(:base, msg) }
    session.delete(:signup_errors)
    session.delete(:signup_params)
  end

  def restore_login_errors
    return unless session[:login_errors].present?

    @login_user.assign_attributes(session[:login_params] || {})
    session[:login_errors].each { |msg| @login_user.errors.add(:base, msg) }
    session.delete(:login_errors)
    session.delete(:login_params)
  end
end
