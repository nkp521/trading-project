class Strategy < ApplicationRecord
  has_many :user_strategies
  has_many :users, through: :user_strategies

  scope :low_risk, -> { where(risk_level: 'Low') }
  scope :medium_risk, -> { where(risk_level: 'Medium') }
  scope :high_risk, -> { where(risk_level: 'Migh') }
end
