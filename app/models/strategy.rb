class Strategy < ApplicationRecord
  has_many :user_strategies
  has_many :users, through: :user_strategies
end
