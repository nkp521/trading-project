class HomeController < ApplicationController
  def index
    @form_type = params[:form] || "login"
  end
end
