class HomeController < ApplicationController
  def index
    @form_type = params[:form] || "login"
    @user = User.new
  end
end
