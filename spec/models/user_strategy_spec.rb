require 'rails_helper'

RSpec.describe UserStrategy, type: :model do
  it 'requires a user' do
    expect(build(:user_strategy, user: nil)).not_to be_valid
  end

  it 'requires a strategy' do
    expect(build(:user_strategy, strategy: nil)).not_to be_valid
  end

  it 'has a valid user_strategy' do
    expect(build(:user_strategy)).to be_valid
  end

  it 'does not allow a duplicate user-strategy' do
    a = create(:user_strategy)
    b = build(:user_strategy, user: a.user, strategy: a.strategy)
    expect(b).not_to be_valid
  end
end
