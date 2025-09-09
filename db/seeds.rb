UserStrategy.destroy_all
Strategy.destroy_all
User.destroy_all

users = [
  { username: "alice", email: "alice@example.com",   password: "password123" },
  { username: "bob", email: "bob@example.com",     password: "password123" },
  { username: "charlie", email: "charlie@example.com", password: "password123" },
  { username: "dana", email: "dana@example.com",    password: "password123" },
  { username: "eva", email: "eva@example.com",     password: "password123" },
  { username: "frank", email: "frank@example.com",   password: "password123" },
  { username: "grace", email: "grace@example.com",   password: "password123" },
  { username: "henry", email: "henry@example.com",   password: "password123" }
]

users.each { |attrs| User.create!(attrs) }

strategies = [
  { name: "RSI Momentum", description: "RSI < 30 = long, RSI > 70 = short.", long_entry: "RSI < 30", short_entry: "RSI > 70", risk_level: "Low" },
  { name: "EMA Crossover", description: "10 EMA cross above/below 50 EMA.", long_entry: "10 EMA > 50 EMA", short_entry: "10 EMA < 50 EMA", risk_level: "Medium" },
  { name: "MACD Divergence", description: "Trade divergences with MACD vs price.", long_entry: "MACD line > Signal", short_entry: "MACD line < Signal", risk_level: "High" },
  { name: "Breakout Strategy", description: "Enter on breakout of support/resistance.", long_entry: "Price breaks resistance", short_entry: "Price breaks support", risk_level: "Medium" },
  { name: "Mean Reversion", description: "Fade Bollinger Band extremes.", long_entry: "Price < lower band", short_entry: "Price > upper band", risk_level: "Low" },
  { name: "Trend Following", description: "Ride trend using moving averages.", long_entry: "Price above 200 EMA", short_entry: "Price below 200 EMA", risk_level: "Medium" },
  { name: "Volume Spike", description: "Enter trades on unusual volume surges.", long_entry: "Volume > 2x average", short_entry: "Volume < 0.5x average", risk_level: "High" },
  { name: "Golden Cross", description: "50 MA crosses above 200 MA.", long_entry: "50 MA > 200 MA", short_entry: "50 MA < 200 MA", risk_level: "Low" },
  { name: "Range Trading", description: "Buy support, sell resistance.", long_entry: "Price near support", short_entry: "Price near resistance", risk_level: "Medium" },
  { name: "Fibonacci Pullback", description: "Enter on Fib retracement levels.", long_entry: "Price at 61.8% retrace", short_entry: "Price at 38.2% retrace", risk_level: "Medium" }
]

strategies.each { |attrs| Strategy.create!(attrs) }

users = User.all
strategies = Strategy.all

users.each do |user|
  strategies.sample(rand(3..5)).each do |strat|
    UserStrategy.find_or_create_by!(user: user, strategy: strat)
  end
end

puts "Done seeding"
