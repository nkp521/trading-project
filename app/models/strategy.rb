class Strategy < ApplicationRecord
  has_many :user_strategies
  has_many :users, through: :user_strategies

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :long_entry, presence: true
  validates :short_entry, presence: true
  validates :risk_level, inclusion: { in: %w[Low Medium High] }

  scope :with_risk, ->(level) { where(risk_level: level) }
  scope :low_risk, -> { where(risk_level: "Low") }
  scope :medium_risk, -> { where(risk_level: "Medium") }
  scope :high_risk, -> { where(risk_level: "High") }
end
