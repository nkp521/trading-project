class StrategiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_user, only: %i[new create]
  before_action :ensure_owner!, only: %i[new create]
  before_action :set_strategy, only: [:show]

  def index
    @strategies = params[:risk].present? ? Strategy.with_risk(params[:risk]) : Strategy.all
  end

  def new
    @strategy = Strategy.new
  end

  def create
    @strategy = Strategy.new(strategy_params)
    if @strategy.save
      UserStrategy.create!(user: @user, strategy: @strategy)
      redirect_to strategies_path, notice: "Strategy created"
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def set_strategy
    @strategy = Strategy.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def ensure_owner!
    unless current_user
      redirect_to new_user_session_path,
                  alert: "Sign in or Create an account to create a strategy" and return
    end

    head :forbidden unless current_user.id == @user.id
  end

  def strategy_params
    params.require(:strategy).permit(:name, :description, :long_entry, :short_entry, :risk_level)
  end
end
