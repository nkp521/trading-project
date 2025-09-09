class Strategy < ApplicationRecord
  has_many :user_strategies
  has_many :users, through: :user_strategies

  scope :with_risk, ->(level) { where(risk_level: level) }
  scope :low, -> { where(risk_level: 'Low') }
  scope :medium, -> { where(risk_level: 'Medium') }
  scope :high, -> { where(risk_level: 'Migh') }
end
