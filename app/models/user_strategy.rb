class UserStrategy < ApplicationRecord
  belongs_to :user
  belongs_to :strategy

  validates :strategy_id, uniqueness: { scope: :user_id }
end
