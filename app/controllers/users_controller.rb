class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]
  before_action :authenticate_user!, only: [ :show ]

  def index
    @users = User.all
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def strategy_params
    params.require(:strategy).permit(:name, :description, :long_entry, :short_entry, :risk_level)
  end
end
