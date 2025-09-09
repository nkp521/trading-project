class StrategiesController < ApplicationController
  before_action :set_strategy, only: [ :show ]
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_user, only: [ :new, :create ]
  
  def index
    @strategies = Strategy.all
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @strategy = @user.strategies.build
  end

  def create
    @user = User.find(params[:user_id])
    @strategy = @user.strategies.build(strategy_params)
    
    if @strategy.save
      redirect_to strategies_path, notice: 'Strategy was successfully created.'
    else
      render :new
    end
  end

  private

  def set_strategy
    @strategy = Strategy.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def strategy_params
    params.require(:strategy).permit(:name, :description, :long_entry, :short_entry, :risk_level)
  end
end
