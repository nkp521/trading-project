FactoryBot.define do
  factory :strategy do
    name { "strategy" }
    description { "description" }
    long_entry { "1234567890" }
    short_entry { "0987654321" }
    risk_level { "Low" }
  end
end
