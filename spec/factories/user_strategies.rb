FactoryBot.define do
  factory :user_strategy do
    association :user
    association :strategy
  end
end
