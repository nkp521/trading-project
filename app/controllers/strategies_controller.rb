class StrategiesController < ApplicationController
  before_action :set_strategy, only: [ :show ]

  def index
    @strategies = Strategy.all
  end

private
  def set_strategy
    @strategy = Strategy.find(params[:id])
  end

  def strategy_params
    params.require(:strategy).permit(:name, :description, :long_entry, :short_entry, :risk_level)
  end
end
